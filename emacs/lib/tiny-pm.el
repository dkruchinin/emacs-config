(defgroup tiny-pm nil
  "Tiny project manager"
  :prefix "tpm/"
  :group 'convenience)

(defvar tpm/current-project 
  '((:name . nil)
    (:compile-command . nil)
    (:clean-command . nil)
    (:root-dir . nil))
  "A buffer-local variable. `tpm/current-project' is an alist
containing project-specific settings in order to make it easy
to specify them via .dir-locals.el file.

  :name is a project name
  :compile-command is command that runs from project root directory
                     to compile project
  :clean-command is a command that runs from project root directory
                 to clean project
  :root-dir is a project root directory. Note that `:root-dir` is determined
            automatically by tiny-pm module. :root-dir will be set to
            directory where .dir-locals.el is located")

(make-variable-buffer-local 'tpm/current-project)

(defvar tpm/show-name-in-modeline t
  "If the variable is non-nil, project name will be
showen in modeline before buffer name")

(defface tpm/modeline-project-name-face
  '((((class color))
     (:foreground "darkgreen")))
  "Face to fontify project name in modeline"
  :group 'tiny-pm)

(defun tpm/getvar (var)
  "Returns the value of project-specific variable VAR
of current project. Current project variables are listed
in `tpm/current-project' buffer-local variable"
  (cdr (assq var tpm/current-project)))

(defun tpm/setvar (var val)
  (setq tpm/current-project 
        (cons (cons var val)
              (assq-delete-all var tpm/current-project))))

(defun tpm/project-name ()
  "Returns current project name if project is active"
  (tpm/getvar :name))

(defun tpm/project-root ()
  "Returns root directory of current project if
project is active."
  (or (tpm/getvar :root-dir)
      (tpm/try-find-project)))

(defun tpm/try-find-project ()
  (when (tpm/project-name)
    (tpm/setvar :root-dir
                (dir-locals-find-file (buffer-file-name)))))

(defun project-compile (&optional command)
  (interactive)
  (let ((cmd (or command
                 (tpm/getvar :compile-command)
                 "make")))
    (save-some-buffers t)
    (compile (compilation-read-command cmd))))

(defun tpm/project-modeline-hook ()
  (when (and tpm/show-name-in-modeline
             (tpm/project-root))
    (make-local-variable 'mode-line-buffer-identification)
    (setq mode-line-buffer-identification
          (nconc 
           (list "[Project: " 
                 (propertize
                  (tpm/project-name) 'face 'tpm/modeline-project-name-face) 
                 "] ")
           (copy-list
            (default-value 
              'mode-line-buffer-identification))))))

(add-hook 'find-file-hook #'tpm/project-modeline-hook)
(provide 'tiny-pm)
