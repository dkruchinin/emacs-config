(require 'xgtags)
(require 'xcscope)

(setq c-doc-comment-style
      '((java-mode . javadoc)
        (pike-mode . autodoc)
        (c-mode    . javadoc)
        (c++-mode  . javadoc)))

(setq c-default-style
      '((java-mode . "java")
        (awk-mode  . "awk")
        (c-mode    . "k&r")
        (c++-mode  . "stroustrup")
        (other     . "gnu")))

;; Load coding styles
(load-file (concat-path DEV-DIR "coding-styles.el"))

(defun anything-semantic ()
  "`anything' for smeantic tags in current buffer"
  (interactive)
  (anything-other-buffer 'anything-c-source-semantic "*anything-semantic*"))

(defun c/c++-common-hook ()
  (define-key c-mode-base-map "\C-m"
    'newline-and-indent)
  (local-set-key (kbd "\C-x m") 'anything-semantic)
  (custom-set-variables
   '(fic-ext-mode t)
   '(xgtags-mode t)
   '(which-function-mode t)
   '(hl-line-mode t)))

(add-hook 'c-mode-hook #'c/c++-common-hook)
(add-hook 'c++-mode-hook #'c/c++-common-hook)
