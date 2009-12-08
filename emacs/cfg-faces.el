;; Standard faces

(defconst DEFAULT-FONT "Monospace-8") ;;"DejaVu Sans Mono-7"

(when window-system
  (set-default-font DEFAULT-FONT))

(custom-set-faces
 '(default ((t (:foreground "#73bda2" :background "#0b0b0b"))))
 '(font-lock-comment-face ((t (:foreground "#798996" :slant italic))))
 '(font-lock-type-face ((t (:foreground "#228a79" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#9d7e55"))))
 '(font-lock-function-name-face ((t (:foreground "#2678ba" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#a9312b" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#b08000"))))
 '(font-lock-preprocessor-face ((t (:foreground "#0a872a" :weight normal :underline nil))))
 '(font-lock-constant-face ((t (:foreground "#803ea6" :weight bold :slant italic))))
 '(font-lock-builtin-face ((t (:foreground "#4b8fc4" :slant italic))))
 '(font-lock-warning-face ((t (:foreground "darkred" :background "#d4b447" :weight bold))))
 '(font-lock-doc-face ((t (:foreground "#4e8e71" :slant italic))))
 '(mode-line ((t (:background "black" :foreground "green"))))
 '(mode-line-buffer-id ((t (:foreground "orange" :slant italic))))
 '(show-paren-match ((t (:background "darkgreen"))))
 '(show-paren-mismatch ((t (:background "red4"))))
 '(minibuffer-prompt ((t (:foreground "SteelBlue"))))
 '(vertical-border ((t (:foreground "darkgrey"))))
 '(cursor ((t (:background "steelblue3"))))
 '(region ((t (:foreground "#0f2315" :background "#986241"))))
 '(completions-common-part ((t (:foreground "DarkGreen"))))
 '(completions-first-difference ((t (:foreground "DarkRed")))))

;; Highline faces
(require 'highline)
(set-face-background 'highline-face "#15161b")
(setq highline-mode t)

