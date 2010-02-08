;; CEDET initialization

(load-file (concat CFG-DIR "/cedet/common/cedet.el"))
(require 'cedet)
(require 'ede)
(require 'semantic)
(require 'semanticdb)
(require 'semanticdb-global)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(global-semantic-idle-summary-mode nil)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semanticdb-enable-gnu-global-databases 'java-mode)

(global-ede-mode 1)
(semantic-load-enable-all-exuberent-ctags-support)
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function 
   (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(semantic-ectag-program "ctags-exuberant"))

;; Projects
(load-file (concat CFG-DIR "/projects.el"))
