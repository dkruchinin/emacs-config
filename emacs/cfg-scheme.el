;; Scheme mode configuration

(require 'quack)

(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme" t)
(custom-set-variables 
 '(quack-pltcollect-dirs "/home/dk/lib/plt-scheme")
 '(quack-pretty-lambda-p nil)
 '(quack-programs (quote ("mzscheme" "bigloo" "mit-scheme")))
 '(quack-remap-find-file-bindings-p nil)
 '(quack-run-scheme-always-prompts-p nil)
 '(quack-switch-to-scheme-method (quote cmuscheme))
 '(quack-smallprint-face (quote default))
 '(scheme-program-name "mzscheme"))
(add-to-list 'auto-mode-alist '("\\.[scm\\|ss]$]" . scheme-mode))
(add-mark-kw-hl 'scheme-mode)

;; customize quack faces
(custom-set-faces
 '(quack-pltish-defn-face ((t (:foreground "#134c87" :weight bold))))
 '(quack-pltish-keyword-face ((t (:foreground "#821d1d" :weight bold))))
 '(quack-pltish-comment-face ((t (:foreground "#9d7e55" :slant italic))))
 '(quack-pltish-paren-face ((t (:foreground "#bd952a"))))
 '(quack-pltish-selfeval-face  ((t (:foreground "#417c3f")))))

(add-hook 'scheme-mode-hook #'highlight-parentheses-mode)