(require 'devlib)
(require 'tiny-pm)
;;(require 'devlib)

(defconst DEV-DIR (concat-path CFG-DIR "dev"))

;; Yasnippet configuration
(require 'yasnippet)
(yas/initialize)
(yas/load-directory 
 (concat-path PLUGINS-DIR "/yasnippet/snippets"))

(hl-line-mode)

;; Highlight TODO/FIXME/etc in comments and strings only
(require 'fic-ext-mode)
(setq fic-highlight-words '("FIXME" "TODO" "BUG" "XXX"))

;; CEDET
(load-file (concat-path PLUGINS-DIR "cedet/common/cedet.el"))
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

;; anything
(require 'anything)
(require 'anything-config)

(mapcar #'(lambda (file) (load-file (concat-path DEV-DIR file)))
        '("dev-cc.el" "dev-js.el"))
