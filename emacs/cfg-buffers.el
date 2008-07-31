;; Fcuntions and keybindings for buffers management

;; Ido
(require 'ido)
(ido-mode)

;; Highline
(require 'highline)
(when window-system
  (set-face-background 'highline-face "#15161b")
  (highline-mode))

;; Blank mode
(require 'blank-mode)
(custom-set-faces
 '(blank-space-face ((t (:foreground "green" :background "grey20"))))
 '(blank-tab-face ((t (:foreground "green" :background "grey20"))))
 '(blank-trailing-face 
   ((t (:foreground "steelblue3" :background "darkred" :weight bold))))
 '(blank-line-face 
   ((t (:foreground "green" :background "grey20" :underline "red3"))))
 '(blank-space-before-tab 
   ((t (:foreground "orange" :background "darkblue")))))

;; sometimes it may be useful to delete selected
;; window and kill buffer it shows with only one function
(defun delete-window-with-buffer ()
"Delete selected window and kill buffer is shows"
  (interactive)
  (kill-buffer (current-buffer))
  (delete-window (selected-window)))

(global-set-key (kbd "\C-c SPC") 'blank-mode)
(global-set-key (kbd "\C-c 0") 'delete-window-with-buffer)
