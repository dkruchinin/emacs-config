;; Scheme mode configuration

(require 'quack)

(autoload 'run-scheme "ypsilon" "Run an inferior Scheme" t)
(custom-set-variables 
 '(quack-pretty-lambda-p t)
 '(quack-programs (quote ("ypsilon" "mzscheme" "bigloo")))
 '(quack-remap-find-file-bindings-p nil)
 '(quack-run-scheme-always-prompts-p nil)
 '(quack-switch-to-scheme-method (quote cmuscheme))
 '(quack-smallprint-face (quote default))
 '(scheme-program-name "ypsilon")
  '(quack-default-program "ypsilon"))
(add-to-list 'auto-mode-alist '("\\.[scm\\|ss\\|scheme]$]" . scheme-mode))
(add-mark-kw-hl 'scheme-mode)

(defun r6rs-describe ()
  (interactive)
  (let ((word (thing-at-point 'word)))
    (info "(r6rs)")
    (Info-index word)))

(add-hook 'scheme-mode-hook #'highlight-parentheses-mode)
