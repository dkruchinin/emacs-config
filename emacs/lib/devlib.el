(require 'dired)
(require 'yasnippet)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'fic-ext-mode)

(defun devlib/filter (predicate seq)
  (cond ((null seq) nil)
        ((funcall predicate (car seq))
         (cons (car seq)
               (devlib/filter predicate (cdr seq))))
        (t
         (devlib/filter predicate (cdr seq)))))

(defun devlib/directory-directories (root-dir &optional full match nosort)
  (let ((dir (file-name-as-directory root-dir)))
    (devlib/filter #'(lambda (file) (file-directory-p (concat dir file)))
                       (directory-files dir full match nosort))))

(defun devlib/concat-path (directory file)
  "Builds path from `directory' and `file'"
  (concat (file-name-as-directory directory) file))

(defun devlib/buffer-major-mode (buf-or-str)
  "Gets buffer's major mode"
  (save-excursion (set-buffer buf-or-str) major-mode))

(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))

(defun gtags-update ()
  "Make GTAGS incremental update"
  (interactive)
  (call-process "global" nil nil nil "-u"))

(provide 'devlib)