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
 '(font-lock-maximum-decorations t)
 '(global-font-lock-mode t)
;; '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(indent-tabs-mode nil)
 '(inhibit-startup-messages t)
 '(menu-bar-mode nil)
 '(next-line-add-newlines nil)
 '(query-replace-highlight t)
 '(require-fonal-newline t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(search-highlight t)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(undabify t)
 '(winner-mode t nil (winner))
 '(vertical-scroll-bar nil))

;; make all yes/no questions a bit shorter
(fset 'yes-or-no-p 'y-or-n-p)
(mapcar #'(lambda (file) (load-file (concat CFG-DIR "/" file)))
        '("cfg-navigation.el"
          "cfg-faces.el"
          "cfg-buffers.el"
          "cfg-devtools.el"
          "cfg-cedet.el"
;;          "cfg-ecb.el"
          "cfg-cc-mode.el"
          "cfg-lisp.el"
          "cfg-scheme.el"
          "cfg-tramp.el"
          "cfg-org-mode.el"
          "cfg-projects.el"
          ))

;; magit
(add-to-list 'load-path (concat CFG-DIR "/magit"))
(require 'magit)

;; show file size in modeline
(size-indication-mode)
(server-start)

(put 'narrow-to-region 'disabled nil)
