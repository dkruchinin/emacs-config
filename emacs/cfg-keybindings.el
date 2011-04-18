;; layout
(windmove-default-keybindings)
(global-set-key "\C-q" 'popframe-kill)

;; navigation
(global-set-key "\M-g" 'goto-line)
(global-set-key (kbd "\C-x i") 'ibuffer)
(global-set-key (kbd "\C-x \C-r") 'select-buffer-from-ring-ido)

;; isearch
(define-key isearch-mode-map "\M-w" 'isearch-yank-word)
(define-key isearch-mode-map "\M-l" 'isearch-yank-line)
(define-key isearch-mode-map "\M-k" 'isearch-yank-kill)

