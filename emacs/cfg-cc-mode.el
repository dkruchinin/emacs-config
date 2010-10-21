;; CC-mode configuration

(require 'emacs-devtools)
(require 'emacs-keys)
(require 'myede)

;;(defface cc-font-lock-preprocessor-face  
;;  '((t (:foreground "#00ab2e" :weight bold :underline nil)))
;;  "An alternative to font-lock-preprocessor face for cc-mode"
;;  :group 'cc-mode)

(defun my-c-mode-common-hook ()
  (define-key c-mode-base-map "\C-m"
    'newline-and-indent)

  (local-set-key EDK-JUMP2MODULE 'semantic-decoration-include-visit)
  (local-set-key EDK-DESCRIBE-METHOD 'semantic-ia-show-summary)
  (local-set-key EDK-SHOW-PROTOTYPE 'semantic-analyze-proto-impl-toggle)
  (local-set-key EDK-COMPILE 'my/ede-compile)
  (local-set-key EDK-COMPLETE 'company-complete)
  (local-set-key EDK-NARROW-TO-METHOD 'senator-narrow-to-defun)
  (local-set-key EDK-METHODS-SUMMARY 'anything-semantic)

  (let ((coding-style (or
					   (my/ede-get-local-var 'coding-style)
					   c-indentation-style)))
    (c-set-style coding-style))

  (let ((indentation (or
                      (my/ede-get-local-var 'indentation)
                      indentation)))
    (when (equal indentation 'tabs)
      (setq indent-tabs-mode t))
    (enable-whitespace-mode (equal indentation 'tabs)))
  (company-mode))

(setq c-doc-comment-style
      '((java-mode . javadoc)
        (pike-mode . autodoc)
        (c-mode    . javadoc)
        (c++-mode  . javadoc)))

(setq c-default-style
      '((java-mode . "java")
        (awk-mode  . "awk")
        (c-mode    . "my")
        (other     . "gnu")))

(load-file (concat CFG-DIR "/coding-styles.el"))
(mapcar #'add-mark-kw-hl '(c-mode c++-mode java-mode))
(add-hook 'c-mode-common-hook #'my-c-mode-common-hook)
