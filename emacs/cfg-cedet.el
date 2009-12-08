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
   '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))

;;(global-semantic-folding-mode 1)

;; Projects

(ede-cpp-root-project 
 "mstring"
 :name "Mstring microkernel"
 :file "/home/dk/work/altell/mstring/Makefile"
 :local-variables '((compile-command . "cd /home/dk/work/altell/mstring/; make")
                    (clean-command   . "cd /home/dk/work/altell/mstring/; make clean")))

(defun my-ede-get-local-var (fname var)
  "fetch given variable var from :local-variables of project of file fname"
  (let* ((current-dir (file-name-directory fname))
         (prj (ede-current-project current-dir)))
    (when prj
      (let* ((ov (oref prj local-variables))
            (lst (assoc var ov)))
        (when lst
          (cdr lst))))))

(require 'compile)
;;(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
;;(setq mode-compile-always-save-buffer-p t)

(defun ede-compile ()
  "Saves all unsaved buffers, and runs 'compile'."
  (interactive)
  (save-some-buffers t)
  (compile (or (my-ede-get-local-var (buffer-file-name (current-buffer)) 'compile-command)
               compile-command)))

(defun ede-clean ()
  (interactive)
  (save-some-buffers t)
  (let ((clean-cmd (my-ede-get-local-var 
                    (buffer-file-name (current-buffer)) 
                    'clean-command)))
    (when clean-cmd
      (compile clean-cmd))))

(global-set-key [f8] 'ede-compile)
(global-set-key [f9] 'ede-clean)