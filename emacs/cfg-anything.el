(require 'anything)
(require 'anything-config)

(setq proel-dirs-with-projects (mapcar 'expand-file-name 
                    (list "~/development/projects"
                          "~/work/altell")))

(require 'proel)

(defun anything-proj-files ()
  "`anything' for files in current `proel' project"
  (interactive)
  (anything-other-buffer 'proel-anything-current-project-files "*anything project files*"))

(defun anything-semantic ()
  "`anything' for smeantic tags in current buffer"
  (interactive)
  (anything-other-buffer 'anything-c-source-semantic "*anything-semantic*"))

(global-set-key (kbd "C-x C-b")  'anything-proj-files)
(global-set-key (kbd "C-x m") 'anything-semantic)