;; eproject

(add-to-list 'load-path (concat CFG-DIR "/eproject"))
(require 'eproject)
(require 'eproject-extras)

;; display project name in minibuffer
(defun my/eproject-modeline ()
  (let ((pname (eproject-name)))
    (when pname
      (make-local-variable 'mode-line-buffer-identification)
      (message "Project name %s" pname)
      (setq mode-line-buffer-identification
            (nconc (list (propertize
                          pname 'face 'modeline-buffer-id) ":")
                   (copy-list (default-value 'mode-line-buffer-identification)))))))

(define-project-type c (generic)
  (look-for ".eproj_c")
  :relevant-files ("\\.c$" "\\.h$" "\\.s$" "\\.S$"))
  
(define-project-type cpp (generic)
  (look-for ".eproj_cpp")
  :relevant-files ("\\.cpp$" "\\.hpp"))

(define-project-type java (generic)
  (look-for ".eproj_java")
  :relevant-files ("\\.java$" "\\.xml$"))
  
(define-project-type lisp (generic)
  (look-for ".eproj_lisp")
  :relevant-files ("\\.lisp$" "\\.cl$"))
  
(define-project-type scheme (generic)
  (look-for ".eproj_scheme")
  :relevant-files ("\\.ss$" "\\.scm$"))

(mapcar '(lambda (x) (add-hook (intern (concat x "-project-file-visit-hook"))
                               'my/eproject-modeline))
        '("c" "cpp" "java" "lisp" "scheme"))

;;(add-hook 'c-project-file-visit-hook 'my/eproject-modeline)