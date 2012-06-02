;; color-theme-dk is my color-theme based
;; on a dark color-theme-solorized by Ethan Schoonover.

(defun color-theme-dk ()
  (interactive)
  (let ((base03  "#002b36")
        (base02  "#073642")
        (base01  "#586e75")
        (base00  "#657b83")
        (base0   "#839496")
        (base1   "#93a1a1")
        (base2   "#eee8d5")
        (base3   "#fdf6e3")
        (yellow  "#b58900")
        (orange  "#cb4b16")
        (red     "#dc322f")
        (magenta "#d33682")
        (violet  "#6c71c4")
        (blue    "#268bd2")
        (cyan    "#2aa198")
        (green   "#859900"))
    (color-theme-install
     `(color-theme-dk
       ((foreground-color . ,base0)
        (background-color . ,base03)
        (background-mode . dark)
        (cursor-color . ,base0))
       ;; basic
       (default ((t (:foreground ,base0))))
       (cursor ((t (:foreground ,base0 :background ,base03 :inverse-video t))))
       (escape-glyph-face ((t (:foreground ,red))))
       (fringe ((t (:foreground ,base01 :background ,base02))))
       (header-line ((t (:foreground ,base0 :background ,base2))))
       (highlight ((t (:background ,base02))))
       (isearch ((t (:foreground "green" :background ,yellow))))
       (isearch-lazy-highlight-face ((t (:foreground "dark red" :background ,yellow))))
       (menu ((t (:foreground ,base0 :background ,base02))))
       (minibuffer-prompt ((t (:foreground ,blue :bold t))))
       (mode-line
        ((t (:foreground ,base1 :background ,base02
                         :box (:line-width 1 :color ,base1)))))
       (mode-line-buffer-id ((t (:foreground ,base1))))
       (mode-line-inactive
        ((t (:foreground ,base0  :background ,base02
                         :box (:line-width 1 :color ,base02)))))
       (region ((t (:background "DarkSlateGray"))))
       (secondary-selection ((t (:background ,base02))))
       (trailing-whitespace ((t (:foreground ,red :inverse-video t))))
       (vertical-border ((t (:foreground ,base0))))
       ;; compilation
       (compilation-info ((t (:forground ,green :bold t))))
       (compilation-warning ((t (:foreground ,orange :bold t))))
       ;; customize
       (custom-button
        ((t (:background ,base02 :box (:line-width 2 :style released-button)))))
       (custom-button-mouse ((t (:inherit custom-button :foreground ,base1))))
       (custom-button-pressed
        ((t (:inherit custom-button-mouse
                      :box (:line-width 2 :style pressed-button)))))
       (custom-comment-tag ((t (:background ,base02))))
       (custom-comment-tag ((t (:background ,base02))))
       (custom-documentation ((t (:inherit default))))
       (custom-group-tag ((t (:foreground ,orange :bold t))))
       (custom-link ((t (:foreground ,violet))))
       (custom-state ((t (:foreground ,green))))
       (custom-variable-tag ((t (:foreground ,orange :bold t))))
       ;; diff
       (diff-added ((t (:foreground ,green :inverse-video t))))
       (diff-changed ((t (:foreground ,yellow :inverse-video t))))
       (diff-removed ((t (:foreground ,red :inverse-video t))))
       ;; emacs-wiki
       (emacs-wiki-bad-link-face ((t (:foreground ,red :underline t))))
       (emacs-wiki-link-face ((t (:foreground ,blue :underline t))))
       (emacs-wiki-verbatim-face ((t (:foreground ,base00 :underline t))))
       ;; font-lock
       (font-lock-builtin-face ((t (:foreground ,green))))
       (font-lock-comment-face ((t (:foreground "PaleTurquoise4" :italic t))))
       (font-lock-constant-face ((t (:foreground ,cyan))))
       (font-lock-function-name-face ((t (:foreground ,blue))))
       (font-lock-keyword-face ((t (:foreground ,green))))
       (font-lock-string-face ((t (:foreground ,cyan))))
       (font-lock-type-face ((t (:foreground ,yellow))))
       (font-lock-variable-name-face ((t (:foreground ,blue))))
       (font-lock-warning-face ((t (:foreground ,red :bold t))))
       (font-lock-doc-face ((t (:foreground "NavajoWhite" :italic t))))
       (font-lock-doc-string-face ((t (:foreground "thistle3"))))
       ;; info
       (info-xref ((t (:foreground ,blue :underline t))))
       (info-xref-visited ((t (:inherit info-xref :foreground ,magenta))))
       ;; org
       (org-hide ((t (:foreground ,base03))))
       (org-todo ((t (:foreground ,red :bold t))))
       (org-done ((t (:foreground ,green :bold t))))
       (org-level-2 ((t (:foreground ,yellow))))
       ;; show-paren
       (show-paren-match ((t (:foreground "green" :bold t))))
       (show-paren-mismatch ((t (:foreground "red" :background "black" :bold t))))
       ;; completions
       (completions-common-part ((t (:foreground ,green :bold t))))
       (completions-first-difference ((t (:foreground ,orange :bold t))))
       ;; IDO faces
       (ido-first-match ((t (:foreground ,green :bold t))))
       (ido-subdir ((t (:foreground ,yellow))))
       (ido-only-match ((t (:inherit completions-common-part))))
       ;; which-func mode
       (which-func ((t (:foreground ,blue))))
       ;;
       ;; Project name in modeline
       ;;
       (tpm/modeline-project-name-face ((t (:foreground ,yellow :bold nil))))
))))

(provide 'color-theme-dk)
