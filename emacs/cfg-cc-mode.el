;; CC-mode configuration

(require 'emacs-devtools)

(defface cc-font-lock-preprocessor-face  
  '((t (:foreground "DarkGreen" :weight bold :underline t)))
  "An alternative to font-lock-preprocessor face for cc-mode"
  :group 'cc-mode)

(defun my-c-mode-common-hook ()
  (setq indent-tabs-mode nil)
  (define-key c-mode-base-map "\C-m" 
    'reindent-then-newline-and-indent)
  (c-set-style "default")
  (enable-cedet)
  (local-set-key "\M-s" 'semantic-complete-analyze-inline)
  (local-set-key (kbd "\C-c <return>") 'semantic-decoration-include-visit)
  (local-set-key (kbd "\C-c e") 'ecb-activate)
  (local-set-key (kbd "\C-c \C-e") 'ecb-deactivate)
  (when window-system
    (enable-hideshow))
  (local-set-key (kbd "\C-x x") 'hs-toggle-hiding))

(setq c-doc-comment-style
      '((java-mode . javadoc)
        (pike-mode . autodoc)
        (c-mode    . javadoc)
        (c++-mode  . javadoc)))

(let ((my-c-style 
        '((c-tab-always-indent        . t)
          (c-comment-only-line-offset . 0)
          (c-hanging-braces-alist     . ((substatement-open after)
                                         (brace-list-open)))
          (c-hanging-colons-alist     . ((member-init-intro before)
                                         (inher-intro)
                                         (case-label after)
                                         (label after)
                                         (access-label after)))
          (c-cleanup-list             . (scope-operator
                                         empty-defun-braces
                                         defun-close-semi))
          (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                         (substatement-open . 0)
                                         (case-label        . 4)
                                         (block-open        . 0)
                                         (knr-argdecl-intro . -)))
          (c-echo-syntactic-information-p . t))))
    (c-add-style "default" my-c-style))

(custom-set-variables
 '(c-preprocessor-face-name (quote cc-font-lock-preprocessor-face))
 '(c-tab-always-indent t)
 '(c-basic-offset 4)
 '(c-tab-width 4))
(mapcar #'add-mark-kw-hl '(c-mode c++-mode java-mode))
(add-hook 'c-mode-common-hook #'my-c-mode-common-hook)