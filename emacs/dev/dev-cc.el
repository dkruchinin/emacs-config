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
(load-file (devlib/concat-path DEV-DIR "coding-styles.el"))

(defun c/c++-common-hook ()
  (define-key c-mode-base-map "\C-m"
    'newline-and-indent)
  (fic-ext-mode)
  (xgtags-mode)
  (setq ac-sources '(ac-source-yasnippet
                     ac-source-dictionary 
                     ac-source-words-in-same-mode-buffers)))


(add-hook 'c-mode-hook #'c/c++-common-hook)
(add-hook 'c++-mode-hook #'c/c++-common-hook)
