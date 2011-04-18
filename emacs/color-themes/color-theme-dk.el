(defun color-theme-dk ()
  (interactive)
  (let ((bg "#222627")
        (fg "#d3d7cf"))
  (color-theme-install
   `(color-theme-dk
     ((background-color . ,bg)
      (background-mode . dark)
      (cursor-color . "orange")
      (mouse-color . "#8ae234")
      (foreground-color . ,fg))
     (default ((t (:background ,bg :foreground ,fg))))
     ;;
     ;; Programming faces
     ;;
     (font-lock-function-name-face ((t (:foreground "SteelBlue1"))))
     (font-lock-keyword-face ((t (:foreground "IndianRed2"))))
     (font-lock-type-face ((t (:foreground "SpringGreen2"))))
     (font-lock-variable-name-face ((t (:foreground "LightSteelBlue3"))))
     (font-lock-preprocessor-face ((t (:foreground "khaki"))))
     (font-lock-comment-face ((t (:foreground "tan"))))
     (font-lock-comment-delimiter-face ((t (:foreground "NavajoWhite"))))
     (font-lock-doc-face ((t (:foreground "NavajoWhite"))))
     (font-lock-doc-string-face ((t (:foreground "red"))))
     (font-lock-string-face ((t (:foreground "LightSalmon1"))))
     (font-lock-constant-face ((t (:foreground "orchid3" :italic t))))
     (show-paren-match ((t (:foreground "green" :bold t))))
     (show-paren-mismatch ((t (:foreground "red" :background "black" :bold t))))
     ;;
     ;; Minibuffer stuff
     ;;
     (minibuffer-prompt ((t (:foreground "steel blue" :bold t))))
     (region ((t (:background "dark slate gray"))))
     (isearch ((t (:background "orange" :foreground "green4" :bold t))))
     (isearch-lazy-highlight-face ((t (:background "yellow4"))))
     (completions-common-part ((t (:foreground "green3" :bold t))))
     (completions-first-difference ((t (:foreground "DarkOrange" :bold t))))
     ;;
     ;; mode-line faces
     ;;
     (mode-line ((t (:foreground "NavajoWhite" :background ,bg
                                 :box (:line-width 1 :color "dark slate gray")))))
     (mode-line-inactive ((t (:background "gray30" :foreground ,fg))))
     (mode-line-buffer-id ((t (:foreground "lime green" :bold t))))
     ;;
     ;; IDO faces
     ;;
     (ido-first-match ((t (:foreground "green yellow" :bold t))))
     (ido-subdir ((t (:foreground "dark orange"))))
     (ido-only-match ((t (:inherit completions-common-part))))
     ;;
     ;; Diff mode
     ;;
     (diff-added ((t (:foreground "SpringGreen3"))))
     (diff-removed ((t (:foreground "firebrick2"))))
     (diff-file-header ((t (:background ,bg :foreground "RoyalBlue1"))))
     (diff-header ((t (:inherit diff-file-header))))
))))

(provide 'color-theme-dk)
