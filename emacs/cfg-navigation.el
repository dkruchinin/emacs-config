;; Miscellaneous navigation functions and bindings

;; Isearch
(custom-set-faces
 '(isearch ((t (:foreground "lightblue" :background "darkred" :weight bold))))
 '(lazy-highlight 
   ((t (:foreground "darkred" :background "lightblue" :weight bold)))))

;; window navigation
;; ido-jump-to-window was taken from http://www.emacswiki.org/emacs/WindowNavigation
(defun my/swap (l)
  (if (cdr l)
      (cons (cadr l) (cons (car l) (cddr l)))
    l))

(defun ido-jump-to-window ()
  (interactive)
  (let* ((visible-buffers 
          (my/swap (mapcar '(lambda (window) (buffer-name (window-buffer window))) (window-list))))
         (buffer-name (ido-completing-read "Window: " visible-buffers))
         window-of-buffer)
    (if (not (member buffer-name visible-buffers))
        (error "'%s' does not have a visible window" buffer-name)
      (setq window-of-buffer
                (delq nil (mapcar '(lambda (window)
                                       (if (equal buffer-name (buffer-name (window-buffer window)))
                                           window
                                         nil))
                                  (window-list))))
      (select-window (car window-of-buffer)))))

(windmove-default-keybindings)

(require 'doremi)
(require 'doremi-frm)
(require 'doremi-cmd)

(define-key isearch-mode-map "\C-z" 'isearch-toggle-case-fold)
(define-key isearch-mode-map "\C-e" 'isearch-toggle-regexp)
(define-key isearch-mode-map "\C-c" 'isearch-yank-char)
(define-key isearch-mode-map "\C-w" 'isearch-yank-word)
(define-key isearch-mode-map "\C-l" 'isearch-yank-line)
(define-key isearch-mode-map "\C-k" 'isearch-yank-kill)
(global-set-key "\M-g" 'goto-line)
(global-set-key (kbd "\C-x w") 'ido-jump-to-window)
(global-set-key (kbd "\C-c r") 'doremi-window-width+)
