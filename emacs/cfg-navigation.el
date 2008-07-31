;; Miscellaneous navigation functions and bindings

;; Isearch
(custom-set-faces
 '(isearch ((t (:foreground "lightblue" :background "darkred" :weight bold))))
 '(lazy-highlight 
   ((t (:foreground "darkred" :background "lightblue" :weight bold)))))

(define-key isearch-mode-map "\C-z" 'isearch-toggle-case-fold)
(define-key isearch-mode-map "\C-e" 'isearch-toggle-regexp)
(define-key isearch-mode-map "\C-c" 'isearch-yank-char)
(define-key isearch-mode-map "\C-w" 'isearch-yank-word)
(define-key isearch-mode-map "\C-l" 'isearch-yank-line)
(define-key isearch-mode-map "\C-k" 'isearch-yank-kill)

;; Global keybindings for different builtin navigation functions
(global-set-key "\M-g" 'goto-line)
(global-set-key [C-M-right] 'windmove-right)
(global-set-key [C-M-left] 'windmove-left)
(global-set-key [C-M-up] 'windmove-up)
(global-set-key [C-M-down] 'windmove-down)