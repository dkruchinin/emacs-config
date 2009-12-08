;; Fcuntions and keybindings for buffers management

;; Ido
(require 'ido)
(ido-mode)

;; Highline
(require 'highline)
(when window-system
  (set-face-background 'highline-face "#15161b")
  (highline-mode))

;; sometimes it may be useful to delete selected
;; window and kill buffer it shows with only one function
(defun delete-window-with-buffer ()
"Delete selected window and kill buffer is shows"
  (interactive)
  (kill-buffer (current-buffer))
  (delete-window (selected-window)))

(global-set-key (kbd "\C-c 0") 'delete-window-with-buffer)
