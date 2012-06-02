(defconst CFG-DIR "~/emacs")
(defconst PLUGINS-DIR "~/.emacs.d/plugins")

(defun concat-path (directory file)
  "Builds path from `directory' and `file'"
  (concat (file-name-as-directory directory) file))

(add-to-list 'load-path PLUGINS-DIR)
(add-to-list 'load-path (concat-path PLUGINS-DIR "anything-config"))
(add-to-list 'load-path (concat-path PLUGINS-DIR "yasnippet"))
(add-to-list 'load-path (concat-path PLUGINS-DIR "color-theme"))
(add-to-list 'load-path (concat-path CFG-DIR "lib"))
(add-to-list 'load-path CFG-DIR)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-auto-save t)
 '(TeX-output-view-style (quote (("^pdf$" "." "okular --unique %s.pdf") ("^dvi$" "." "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start \"\" %f"))) t)
 '(TeX-parse-self t)
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "okular") (output-html "xdg-open"))))
 '(blink-cursor-mode t)
 '(browse-url-browser-function (quote browse-url-firefox))
 '(column-number-mode t)
 '(common-lisp-hyperspec-root "/home/dk/lib/lisp/hyperspec/" t)
 '(current-language-environment "UTF-8")
 '(default-indicate-empty-lines t t)
 '(default-input-method "cyrilic-jcuken")
 '(font-lock-maximum-decorations t)
 '(global-font-lock-mode t)
 '(ido-case-fold t)
 '(ido-confirm-unique-completion t)
 '(ido-enable-flex-matching t)
 '(ido-enable-last-directory-history t)
 '(ido-everywhere nil)
 '(ido-ignore-buffers (quote ("*")))
 '(ido-save-directory-list-file "~/.emacs.d/cache/ido.last")
 '(ido-use-file-at-point nil)
 '(ido-use-url-at-point nil)
 '(inhibit-startup-messages t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(next-line-add-newlines nil)
 '(popwin:popup-window-height 14)
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
 '(vertical-scroll-bar nil t)
 '(window-min-height 1)
 '(window-min-width 1)
 '(winner-mode t nil (winner))
 '(woman-fontify t)
 '(aquamacs-autoface-mode nil))

(setq-default indent-tabs-mode nil)
(setq-default cursor-type 'bar)

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

