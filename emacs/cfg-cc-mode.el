;; CC-mode configuration

(require 'emacs-devtools)
;;(require 'xcscope)
(require 'myede)

;;(defface cc-font-lock-preprocessor-face  
;;  '((t (:foreground "#00ab2e" :weight bold :underline nil)))
;;  "An alternative to font-lock-preprocessor face for cc-mode"
;;  :group 'cc-mode)

(defun my-c-mode-common-hook ()
  (setq indent-tabs-mode nil)
;;  (setq c-preprocessor-face-name 'cc-font-lock-preprocessor-face)
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
  (enable-whitespace-mode)
  (company-mode))

(setq c-doc-comment-style
      '((java-mode . javadoc)
        (pike-mode . autodoc)
        (c-mode    . javadoc)
        (c++-mode  . javadoc)))

(let ((my-c-style 
        '((c-tab-always-indent        . t)
          (c-tab-width                . 4)
          (c-basic-offset             . 4)
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
    (c-add-style "my" my-c-style))

(setq c-default-style
      '((java-mode . "java")
        (awk-mode  . "awk")
        (c-mode    . "my")
        (other     . "gnu")))

(mapcar #'add-mark-kw-hl '(c-mode c++-mode java-mode))
(add-hook 'c-mode-common-hook #'my-c-mode-common-hook)
