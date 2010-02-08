;; Compilation window settings

(require 'compile)

(setq compilation-scroll-output t)
(setq compilation-window-height 10)

(defun my/compilation-hook ()
  (progn 
    (if (not (get-buffer-window "*compilation*"))
        (progn
          (split-window-vertically)))))

(add-hook 'compilation-mode-hook 'my/compilation-hook)

;; Whitespace mode setttings

(defun enable-whitespace-mode ()  
  (setq whitespace-style 
        '(lines lines-tail space-after-tab space-before-tab trailing))
  (custom-set-faces
    '(whitespace-line ((t (:foreground "Orange" :background "DarkSlateGray"))))
    '(whitespace-trailing ((t (:background "IndianRed")))))
  (whitespace-mode))

;; Highlite parentheses. Quite useful 
;; minor mode for lisp-like languages
(require 'highlight-parentheses)
(setq hl-paren-colors 
      '("#ef6b00" "#2700ef" "#c117bb"))

;; Visual bookmarks
(require 'bm)

;; Keybindings
(global-set-key (kbd "\C-c ;") 'comment-region)
(global-set-key (kbd "\C-c :") 'uncomment-region)
(global-set-key (kbd "\C-x SPC") 'bm-toggle)
(global-set-key (kbd "<f2>") 'bm-next)
(global-set-key (kbd "<C-f2>") 'bm-previous)
