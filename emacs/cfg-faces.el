;; Standard faces

(defconst DEFAULT-FONT "DejaVu Sans Mono-9")

(when window-system
  (set-default-font DEFAULT-FONT))

(if (display-graphic-p)
  (set-fontset-font (frame-parameter nil 'font) 'han '("STHeiti" . "unicode-bmp")))
;;(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'vertical-border nil :foreground "#111111")
(custom-set-faces
 '(default ((t (:foreground "medium aquamarine" :background "#0b0b0b"))))
 '(font-lock-comment-face ((t (:foreground "DarkSlateGray4" :slant italic))))
 '(font-lock-type-face ((t (:foreground "DeepSkyBlue3" :weight bold))))
 '(font-lock-string-face ((t (:foreground "ivory3"))))
 '(font-lock-function-name-face ((t (:foreground "IndianRed3" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "forest green" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "LightSalmon3"))))
 '(font-lock-preprocessor-face ((t (:foreground "DarkGoldenrod2" :weight normal :underline nil))))
 '(font-lock-constant-face ((t (:foreground "light slate blue" :weight bold :slant italic))))
 '(font-lock-builtin-face ((t (:foreground "#4b8fc4" :slant italic))))
 '(font-lock-warning-face ((t (:foreground "darkred" :background "#d4b447" :weight bold))))
 '(font-lock-doc-face ((t (:foreground "#4e8e71" :slant italic))))
 '(mode-line ((t (:background "gray10" :foreground "DodgerBlue2" :box nil))))
 '(mode-line-inactive ((t (:background "gray20" :foreground "DarkSlateGray3" ))))
 '(mode-line-buffer-id ((t (:foreground "tomato3" :weight bold))))
 '(mode-line-highlight ((t (:foreground "green"))))
;; '(vertical-border ((t (nil :foreground "forest green"))))
 '(show-paren-match ((t (:background "green" :foreground "blue"))))
 '(show-paren-mismatch ((t (:background "red" :foreground "black"))))
 '(minibuffer-prompt ((t (:foreground "SteelBlue"))))
 '(cursor ((t (:background "steelblue3"))))
 '(region ((t (:foreground "#0f2315" :background "#986241"))))
 '(completions-common-part ((t (:foreground "DarkGreen"))))
 '(completions-first-difference ((t (:foreground "DarkRed")))))

;; Highline faces
(require 'highline)
(set-face-background 'highline-face "#15161b")
(setq highline-mode t)

