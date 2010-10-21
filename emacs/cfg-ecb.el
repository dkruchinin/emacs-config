;; ECB initialization

(add-to-list 'load-path (concat CFG-DIR "/ecb"))
(require 'ecb)
(custom-set-variables
 '(ecb-auto-activate nil)
 '(ecb-directories-update-speedbar t)
 '(ecb-directories-face (quote ecb-default-highlight-face))
 '(ecb-highlight-tag-with-delay nil)
 '(ecb-kill-buffer-clears-history (quote auto))
 '(ecb-layout-name "left9")
 '(ecb-prescan-directories-for-emptyness nil)
 '(ecb-select-edit-window-on-redraw t)
 '(ecb-source-path '("~/development"))
 '(ecb-sources-sort-ignore-case t)
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-height 0.33)
 '(ecb-windows-width 0.19)
 '(ecb-options-version "2.40")
;; '(ecb-compile-window-height 10)
 '(ecb-fix-window-size t))

(defun ecb-toggle-windows/smart ()
  "Toggle ECB windows and activate ECB if needed"
  (interactive)
  (if (ecb-minor-mode)
      (ecb-toggle-ecb-windows) (ecb-activate)))
   
