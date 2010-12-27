;; LaTeX configuration

(load "auctex.el" nil t t)
(require 'tex-mik)

(setq ispell-dictionary "english")
(setq ispell-local-dictionary "russian")

(setq-default TeX-master t)
(custom-set-variables
 '(TeX-auto-save t)
 '(TeX-parse-self t)
 '(TeX-PDF-mode t)
 '(TeX-view-program-selection
   (quote (((output-dvi style-pstricks)
            "dvips and gv") (output-dvi "xdvi")
            (output-pdf "okular") (output-html "xdg-open"))))
 '(TeX-output-view-style
   (quote
    (("^pdf$" "." "okular --unique %s.pdf")
     ("^dvi$" "." "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start \"\" %f"))))
 '(inhibit-startup-screen t))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
