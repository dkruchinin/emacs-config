;; ECB initialization

(add-to-list 'load-path (concat CFG-DIR "/ecb"))
(require 'ecb)
(custom-set-variables
 '(ecb-auto-activate nil)
 '(ecb-directories-update-speedbar t)
 '(ecb-directories-face 'ecb-default-highlight-face)
 '(ecb-highlight-tag-with-delay nil)
 '(ecb-kill-buffer-clears-history 'auto)
 '(ecb-layout-name "left9")
 '(ecb-prescan-directories-for-emptyness nil)
 '(ecb-select-edit-window-on-redraw t)
 '(ecb-source-path '("~/development"))
 '(ecb-sources-sort-ignore-case nil)
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-height 0.33)
 '(ecb-windows-width 0.19)
 '(ecb-options-version "2.40"))

(custom-set-faces
 '(ecb-default-highlight-face 
   ((((class color) (background dark)) (:background "#463524"))))
 '(ecb-mode-line-prefix-face 
   ((((class color) (background dark)) (:foreground "forestgreen")))))

