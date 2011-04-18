(defconst CFG-DIR "/home/dk/emacs")
(defconst PLUGINS-DIR "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path "~/.emacs.d/plugins/eproject")
(add-to-list 'load-path (concat CFG-DIR "/lib"))

(defconst CFG-DIR "/home/dk/emacs")
(add-to-list 'load-path CFG-DIR)

(custom-set-variables
 '(blink-cursor-mode t)
 '(common-lisp-hyperspec-root "/home/dk/lib/lisp/hyperspec/" t)
 '(current-language-environment "UTF-8")
 '(default-indicate-empty-lines t t)
 '(default-input-method "cyrilic-jcuken")
 '(font-lock-maximum-decorations t)
 '(global-font-lock-mode t)
 '(inhibit-startup-messages t)
 '(next-line-add-newlines nil)
 '(query-replace-highlight t)
 '(require-fonal-newline t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(search-highlight t)
 '(show-paren-mode t)
 '(tab-width 4)
 '(transient-mark-mode t)
 '(undabify t)
 '(winner-mode t nil (winner))
 '(woman-fontify t))

(setq-default indent-tabs-mode nil)

;; FIXME: wtf?
(make-local-variable 'indentation)
(setq-default indentation 'space)

;; make all yes/no questions a bit shorter
(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-page 'disabled nil)

(mapcar #'(lambda (file) (load-file (concat CFG-DIR "/" file)))
            '("cfg-faces.el"
              "cfg-layout.el"
              "cfg-buffers.el"
              "cfg-keybindings.el"
              "cfg-devel.el"
              "cfg-latex.el"))
;; (mapcar #'(lambda (file) (load-file (concat CFG-DIR "/" file)))
;;         '("cfg-navigation.el"
;;           "cfg-faces.el"
;;           "cfg-buffers.el"
;;           "cfg-devtools.el"
;;           "cfg-cedet.el"
;;           "cfg-ecb.el"
;;           "cfg-cc-mode.el"
;;           "cfg-lisp.el"
;;           "cfg-scheme.el"
;; 	  "cfg-perl.el"
;;           "cfg-tramp.el"
;;           "cfg-org-mode.el"
;;           "cfg-projects.el"
;;           "cfg-latex.el"
;;           ))


;; show file size in modeline
(size-indication-mode)
(server-start)
