;; Standard faces
(add-to-list 'load-path (concat CFG-DIR "/color-themes"))
(require 'color-theme)
(require 'color-theme-dk)

(when (display-graphic-p)
  (set-fontset-font (frame-parameter nil 'font) 'han '("STHeiti" . "unicode-bmp")))

(color-theme-dk)
(bar-cursor-mode)

