(require 'eproject)
(require 'eproject-extras)

(defface tpm/modeline-project-name-face  
  '((t (:foreground "#75d2a3" :bold t :underline nil :italic nil)))
  "description"
  :group 'tiny-pm)

(defun tpm/project-buffers ()
  (when (project-root)
    (cdr (assoc (project-root) (eproject--project-buffers)))))

(defun tpm/project-modeline-hook ()
  (when eproject-mode
    (make-local-variable 'mode-line-buffer-identification)
    (setq mode-line-buffer-identification
          (nconc 
           (list "[Project: " 
                 (propertize
                  (project-name) 'face 'tpm/modeline-project-name-face) 
                 " ("
                 (propertize
                  (project-type) 'face 'tpm/modeline-project-name-face) ")] ")
           (copy-list 
            (default-value 
              'mode-line-buffer-identification))))))

(defalias 'project-active-p 'eproject-maybe-turn-on)
(defalias 'project-name 'eproject-name)

(defun project-root ()
  eproject-root)

(defun project-type ()
  (symbol-name (eproject-type)))

(defun project-getvar (key)
  (when (project-root)
    (eproject-attribute key)))

(defun project-buffers-ido ()
  (interactive)
  (if (not (project-root))
      (error "No active project was found")
    (switch-to-buffer
     (ido-completing-read
      (concat (project-name) " buffers: ")
      (mapcar #'buffer-name (tpm/project-buffers))))))

(defun project-compile (&optional command)
  (interactive)
  (let ((cmd (or command
                 (project-getvar :compile-command)
                 "make")))
    (save-some-buffers t)
    (compile (compilation-read-command cmd))))

(add-hook 'find-file-hook #'tpm/project-modeline-hook)

;; project types
(define-project-type my-generic (generic)
  (look-for ".eproject")
  :irrelevant-files ("^[.]" "^[#]" "TAGS")
  :config-file ".eproject")

(define-project-type c/c++ (my-generic)
  (look-for ".cproj")
  :relevant-files ("\\.c$" "\\.cpp$" "\\.cxx$" 
                   "\\.h$" "\\.hpp$" "\\.hxx$"
                   "\\.s$" "\\.S$")
  :config-file ".cproj"
  :use-gtags nil
  :use-cscope nil
  :compile-command nil
  :clean-command nil
  :include-dirs nil
  :cflags nil)

(provide 'tiny-pm)
