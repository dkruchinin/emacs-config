(require 'popframe)
(require 'popwin)

(custom-set-variables
 '(vertical-scroll-bar nil)
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(column-number-mode t)
 '(window-min-width 1)
 '(window-min-height 1)
 '(special-display-function 'popframe/special-display-function)
 '(special-display-buffer-names
   (quote ("*Help*" "*compilation*" "*grep*" "*xgtags*")))
 '(popwin:popup-window-height 14))


(fringe-mode '(1 . 1))
;; (setq popwin:special-display-config '())
;; (push '("\*anything\*" :regexp t :height 20) popwin:special-display-config)
;; (push '("*Completions*" :regexp nil :height 20) popwin:special-display-config)
;;(setq special-display-function 'special-display-popup-frame)
;; "*Ido Completions*"

