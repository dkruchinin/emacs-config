;; Fcuntions and keybindings for buffers management

;; Ido
(require 'ido)
(setq ido-enable-flex-matching t)
(ido-mode)

;; Uniquify
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

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

(defun toggle-mode-line()
  "Toggles modeline on and off"
  (interactive)
  (setq mode-line-format
        (if (equal mode-line-format nil)
            (default-value 'mode-line-format) nil))
  (redraw-display))

(global-set-key (kbd "\C-c 0") 'delete-window-with-buffer)
(global-set-key [M-f12] 'toggle-mode-line)
