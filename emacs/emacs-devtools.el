;; Miscellaneous development helpers

(defconst WHITESPACE-DEFAULT-STYLE
  '(lines lines-tail space-before-tab::tab
          space-after-tab::tab trailing))

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

(defun enable-whitespace-mode (use-tabs?)
  (make-local-variable 'whitespace-style)
  (setq whitespace-style
        (cons (if use-tabs?
                  'indentation::tab 'indentation::space)
              WHITESPACE-DEFAULT-STYLE))
  (whitespace-mode))


;; Anythign and semantic settings
(require 'anything)
(defun anything-semantic ()
  "`anything' for smeantic tags in current buffer"
  (interactive)
  (anything-other-buffer 'anything-c-source-semantic "*anything-semantic*"))

(provide 'emacs-devtools)
