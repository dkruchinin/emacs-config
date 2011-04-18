(require 'anything)
(require 'devlib)
(require 'tiny-pm)
;;(require 'devlib)

(defconst DEV-DIR (concat CFG-DIR "/dev"))

;; Yasnippet configuration
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat PLUGINS-DIR "/yasnippet/snippets"))

;; Highlight TODO/FIXME/etc in comments and strings only
(require 'fic-ext-mode)
(setq fic-highlight-words '("FIXME" "TODO" "BUG" "XXX"))

;; auto-complete mode
(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories (concat PLUGINS-DIR "/auto-complete/dict"))
(ac-config-default)

(mapcar #'(lambda (file) (load-file (concat DEV-DIR "/" file)))
        '("dev-cc.el"))
