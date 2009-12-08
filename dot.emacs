(defconst CFG-DIR "/home/dk/emacs")
(add-to-list 'load-path CFG-DIR)
(add-to-list 'load-path (concat CFG-DIR "/modules"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(c-basic-offset 4)
 '(c-tab-always-indent t)
 '(c-tab-width 4)
 '(column-number-mode t)
 '(common-lisp-hyperspec-root "/home/dk/lib/lisp/hyperspec/" t)
 '(current-language-environment "UTF-8")
 '(default-indicate-empty-lines t t)
 '(default-input-method "cyrilic-jcuken")
 '(ecb-auto-activate nil)
 '(ecb-directories-face (quote ecb-default-highlight-face))
 '(ecb-directories-update-speedbar t)
 '(ecb-highlight-tag-with-delay nil)
 '(ecb-kill-buffer-clears-history (quote auto))
 '(ecb-layout-name "left9")
 '(ecb-options-version "2.40")
 '(ecb-prescan-directories-for-emptyness nil)
 '(ecb-select-edit-window-on-redraw t)
 '(ecb-source-path (quote ("~/development")))
 '(ecb-sources-sort-ignore-case nil)
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-height 0.33)
 '(ecb-windows-width 0.19)
 '(font-lock-maximum-decorations t)
 '(global-font-lock-mode t)
;; '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/bin/sbcl")
 '(inhibit-startup-messages t)
 '(menu-bar-mode nil)
 '(next-line-add-newlines nil)
 '(quack-pltcollect-dirs "/home/dk/lib/plt-scheme")
 '(quack-pretty-lambda-p nil)
 '(quack-programs (quote ("mzscheme" "bigloo" "mit-scheme")))
 '(quack-remap-find-file-bindings-p nil)
 '(quack-run-scheme-always-prompts-p nil)
 '(quack-smallprint-face (quote default) t)
 '(quack-switch-to-scheme-method (quote cmuscheme))
 '(query-replace-highlight t)
 '(require-fonal-newline t)
 '(save-place t nil (saveplace))
 '(scheme-program-name "mzscheme")
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(search-highlight t)
 '(semantic-ectag-program "ctags-exuberant")
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(show-paren-mode t)
 '(slime-backend (concat CFG-DIR "/slime/swank-loader.lisp"))
 '(slime-net-coding-system (quote utf-8-unix))
 '(slime-startup-anomation nil)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(undabify t)
 '(winner-mode t nil (winner)))

;; make all yes/no questions a bit shorter
(fset 'yes-or-no-p 'y-or-n-p)
(mapcar #'(lambda (file) (load-file (concat CFG-DIR "/" file)))
        '("cfg-navigation.el"
          "cfg-faces.el"
          "cfg-buffers.el"
          "cfg-devtools.el"
          "cfg-cedet.el"
          "cfg-ecb.el"
          "cfg-cc-mode.el"
          "cfg-lisp.el"
          "cfg-scheme.el"
          "cfg-tramp.el"))

(add-to-list 'load-path (concat CFG-DIR "/magit"))
(require 'magit)

;; show file size in modeline
(size-indication-mode)
(server-start)
