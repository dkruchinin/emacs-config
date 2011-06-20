(require 'anything)
(require 'devlib)
(require 'tiny-pm)
;;(require 'devlib)

(defconst DEV-DIR (concat CFG-DIR "/dev"))

;; Yasnippet configuration
(require 'yasnippet)
(yas/initialize)
(yas/load-directory 
 (devlib/concat-path PLUGINS-DIR "/yasnippet/snippets"))

;; Highlight TODO/FIXME/etc in comments and strings only
(require 'fic-ext-mode)
(setq fic-highlight-words '("FIXME" "TODO" "BUG" "XXX"))

;; auto-complete mode
(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories 
             (devlib/concat-path PLUGINS-DIR "/auto-complete/dict"))
(ac-config-default)

;; smart tabs
(require 'smarttabs)

;; CEDET
(load-file (devlib/concat-path PLUGINS-DIR "/cedet/common/cedet.el"))
(require 'cedet)
(require 'ede)
(require 'semantic)
(require 'semanticdb)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(global-semantic-idle-summary-mode nil)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semanticdb-enable-gnu-global-databases 'java-mode)
(setq-mode-local c-mode semanticdb-find-default-throttle '(file))
(setq-mode-local c++-mode semanticdb-find-default-throttle '(file))

(mapcar #'(lambda (file) (load-file (devlib/concat-path DEV-DIR file)))
        '("dev-cc.el"))
