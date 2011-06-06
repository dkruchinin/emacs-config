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
 '(org-agenda-files (quote ("~/.orgfiles/gtd.org")))
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
 '(org-agenda-tags-todo-honor-ignore-options nil)
 '(org-agenda-todo-ignore-deadlines t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-window-setup (quote current-window))
 '(org-directory "~/.orgfiles")
 '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")
 '(org-log-done t)
 '(org-use-fast-todo-selection t)
 '(org-use-tag-inheritance t)
 '(popwin:popup-window-height 14)
 '(query-replace-highlight t)
 '(require-fonal-newline t)
 '(safe-local-variable-values (quote ((tpm/current-project (:name . "Solaris kernel")) (tpm/current-project (:name . "Pepsal") (:compile-command . "make")))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(search-highlight t)
 '(show-paren-mode t)
 '(special-display-buffer-names (quote ("*Help*" "*compilation*" "*grep*" "*xgtags*" "*cscope*")))
 '(special-display-function (quote popframe/special-display-function))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(undabify t)
 '(vertical-scroll-bar nil t)
 '(window-min-height 1)
 '(window-min-width 1)
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
              "cfg-latex.el"
              "cfg-tramp.el"
              "cfg-org-mode.el"))
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
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
