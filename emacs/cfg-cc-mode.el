;; CC-mode configuration

(require 'emacs-devtools)
;;(require 'xcscope)
(require 'myede)

;;(defface cc-font-lock-preprocessor-face  
;;  '((t (:foreground "#00ab2e" :weight bold :underline nil)))
;;  "An alternative to font-lock-preprocessor face for cc-mode"
;;  :group 'cc-mode)

(defun my-c-mode-common-hook ()
  (define-key c-mode-base-map "\C-m"
    'newline-and-indent)
  (local-set-key (kbd "\C-c \C-s") 'semantic-complete-analyze-inline)
  (local-set-key (kbd "\C-c <return>") 'semantic-decoration-include-visit)
  (local-set-key (kbd "\C-x x") 'hs-toggle-hiding)
  (local-set-key (kbd "\C-z") 'semantic-ia-show-summary)
  (local-set-key (kbd "\C-c p") 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "\C-c , l") 'semantic-ia-fast-jump)
  (local-set-key (kbd "\C-c g e") 'ecb-goto-window-methods)
  (local-set-key (kbd "<f8>") 'my/ede-compile)
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
