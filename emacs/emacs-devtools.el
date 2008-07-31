;; Miscellaneous development helpers

;; CEDET configuration
(require 'cedet)
(defun enable-cedet ()
  (semantic-load-enable-minimum-features)
  (semantic-load-enable-code-helpers))

;; Hideshow
(defun enable-hideshow ()
  (hs-minor-mode)
  (hideshowvis-minor-mode))

;; Highlite some additional keywords
(defun add-mark-kw-hl (mode)
  "Highlite FIXME/TODO/NOTE/XXX keywords for hiven `mode`"
  (font-lock-add-keywords 
   mode '(("\\<\\(FIXME\\|TODO\\|NOTE\\|XXX\\)" 
          1 font-lock-warning-face prepend))))

(provide 'emacs-devtools)
