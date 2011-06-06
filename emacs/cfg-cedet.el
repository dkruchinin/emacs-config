;; CEDET initialization

(load-file (concat CFG-DIR "/cedet/common/cedet.el"))
(require 'cedet)
(require 'ede)
(require 'semantic)
(require 'semanticdb)
(require 'anything)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(global-semantic-idle-summary-mode nil)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semanticdb-enable-gnu-global-databases 'java-mode)

(global-ede-mode 1)
;;(semantic-load-enable-all-exuberent-ctags-support)
(setq-mode-local c-mode semanticdb-find-default-throttle '(file))
(setq-mode-local c++-mode semanticdb-find-default-throttle '(file))

