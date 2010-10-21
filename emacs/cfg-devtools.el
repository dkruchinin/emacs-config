;; company-mode settings
(add-to-list 'load-path (concat CFG-DIR "/cm"))
(autoload 'company-mode "company" nil t)

;; disable company-mode idle completion
(setq company-idle-delay nil)

;; Highlite parentheses. Quite useful 
;; minor mode for lisp-like languages
(require 'highlight-parentheses)
(setq hl-paren-colors 
      '("#ef6b00" "#2700ef" "#c117bb"))

;; Visual bookmarks
(require 'bm)
(add-to-list 'load-path (concat CFG-DIR "/cm"))
(autoload 'company-mode "company" nil t)

(defun anything-semantic ()
  "`anything' for smeantic tags in current buffer"
  (interactive)
  (anything-other-buffer 'anything-c-source-semantic "*anything-semantic*"))

;; compile-mode settings
(require 'compile)

(setq compilation-scroll-output t)
(setq compilation-window-height 10)

(defun my/compilation-hook ()
  (let ((compilation-window (get-buffer-window "*compilation*")))
    (if (windowp compilation-window)
        (select-window compilation-window)
      (progn 
        (split-window-vertically)
        (windmove-down)
        (switch-to-buffer "*compilation*")))))

(add-hook 'compilation-mode-hook 'my/compilation-hook)

;; Keybindings
(global-set-key (kbd "\C-c ;") 'comment-region)
(global-set-key (kbd "\C-c :") 'uncomment-region)
(global-set-key (kbd "\C-x SPC") 'bm-toggle)
(global-set-key (kbd "<f2>") 'bm-next)
(global-set-key (kbd "<C-f2>") 'bm-previous)
