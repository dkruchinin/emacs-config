(require 'ede)
(require 'project-types)

;; taken from eproject
(defun my/ede-search-directory-tree (directory file-regexp exclude-dirs)
  (loop for file in (directory-files (file-name-as-directory directory) t "^[^.]" t)
        when (and (not (file-directory-p file))
                  (string-match file-regexp file))
        collect file into files
        when (file-directory-p file)
        collect file into directories
        finally return
          (nconc files
                 (loop for dir in
                       (set-difference directories exclude-dirs
                                       :test (lambda (x y) (equal x y)))
                       nconc (my/ede-search-directory-tree dir file-regexp exclude-dirs)))))

(defun my/ede-combine-regexps (regexp-list)
  (format "\\(?:%s\\)"
          (reduce (lambda (a b) (concat a "\\|" b))
                  (mapcar (lambda (f) (format "\\(?:%s\\)" f)) regexp-list))))

(defun* my/ede-list-project-files ()
  (let ((proj (ede-current-project)))
    (when proj
      (let* ((matcher (my/ede-combine-regexps
                       (oref proj project-files-regex)))
             (root-dir (ede-project-root-directory proj))
             (exclude-dirs (mapcar
                            (lambda (d) (expand-file-name (concat root-dir d)))
                            (oref proj exclude-dirs))))
        (my/ede-search-directory-tree root-dir matcher exclude-dirs)))))

(defun my/ede-get-local-var (var)
  (let ((prj (ede-current-project)))
    (when prj
      (let* ((ov (oref prj local-variables))
             (lst (assoc var ov)))
        (when lst
          (cdr lst))))))

(defun my/ede-get-root-dir ()
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir)))
    (ede-project-root-directory prj)))

(defun my/ede-project-name ()
  (let ((proj (ede-current-project)))
    (when proj
      (ede-name proj))))

(defun my/ede-project-buffers ()
  (let ((proj (ede-current-project)))
    (when proj
      (ede-project-buffers proj))))

;; display project name in minibuffer
(defun my/ede-modeline ()
  (let ((pname (my/ede-project-name)))
    (when pname
      (make-local-variable 'mode-line-buffer-identification)
      (message "Project name %s" pname)
      (setq mode-line-buffer-identification
            (nconc (list (propertize
                          pname 'face 'modeline-buffer-id) ":")
                   (copy-list (default-value 'mode-line-buffer-identification)))))))

(defun my/ede-get-compile-command ()
  (let ((cmd (or (my/ede-get-local-var 'compile-command)
                 compile-command)))
    (if (functionp cmd) (funcall cmd) cmd)))

(defun my/ede-compile ()
  (interactive)
  (save-some-buffers t)
  (let ((cmd (my/ede-get-compile-command)))
    (set (make-local-variable 'compile-command)
         (concat "cd " (my/ede-get-root-dir) ";" cmd))
    (compile compile-command)))

(add-hook 'find-file-hook #'my/ede-modeline)

(provide 'myede)
