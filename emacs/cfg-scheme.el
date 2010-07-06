;; Scheme mode configuration

(require 'quack)

(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme" t)
(custom-set-variables 
 '(quack-pretty-lambda-p nil)
 '(quack-programs (quote ("mzscheme" "bigloo" "mit-scheme")))
 '(quack-remap-find-file-bindings-p nil)
 '(quack-run-scheme-always-prompts-p nil)
 '(quack-switch-to-scheme-method (quote cmuscheme))
 '(quack-smallprint-face (quote default))
 '(scheme-program-name "mzscheme"))
(add-to-list 'auto-mode-alist '("\\.[scm\\|ss\\|scheme]$]" . scheme-mode))
(add-mark-kw-hl 'scheme-mode)

(defun r6rs-describe ()
  (interactive)
  (let ((word (thing-at-point 'word)))
    (info "(r6rs)")
    (Info-index word)))


;; customize quack faces
(custom-set-faces
 '(quack-pltish-defn-face ((t (:foreground "IndianRed3" :weight bold))))
 '(quack-pltish-keyword-face ((t (:foreground "forest green" :weight bold))))
 '(quack-pltish-comment-face ((t (:foreground "DarkSlateGray4" :slant italic))))
 '(quack-pltish-paren-face ((t (:foreground "#bd952a"))))
 '(quack-pltish-selfeval-face  ((t (:foreground "#417c3f")))))

(add-hook 'scheme-mode-hook #'highlight-parentheses-mode)
