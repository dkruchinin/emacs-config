(defconst CFG-DIR "/home/dk/emacs")
(add-to-list 'load-path CFG-DIR)

(custom-set-variables
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-indicate-empty-lines t t)
 '(default-input-method "cyrilic-jcuken")
 '(font-lock-maximum-decorations t)
 '(global-font-lock-mode t)
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
 '(winner-mode t nil (winner)))

;; make all yes/no questions a bit shorter
(fset 'yes-or-no-p 'y-or-n-p)
(mapcar #'(lambda (file) (load-file (concat CFG-DIR "/" file)))
        '("cfg-navigation.el"
          "cfg-faces.el"
          "cfg-buffers.el"
          "cfg-devtools.el"
          "cfg-cc-mode.el"
          "cfg-lisp.el"
          "cfg-scheme.el"))

;; show file size in modeline
(size-indication-mode)
(server-start)
