(require 'anything)
(require 'anything-config)
(require 'eproject)
(require 'eproject-extras)

(defvar anything-c-source-eproject-files
  '((name . "Files in eProject")
    (init . (lambda () (if (buffer-file-name)
                           (setq anything-eproject-root-dir (eproject-maybe-turn-on))
                         (setq anything-eproject-root-dir 'nil)
                         )))
    (candidates . (lambda () (if anything-eproject-root-dir
                                 (eproject-list-project-files anything-eproject-root-dir))))
    (type . file)
    )
  "Search for files in the current eProject.")

(defvar anything-c-source-eproject-buffers
  '((name . "Buffers in this eProject")
    (init . (lambda () (if (buffer-file-name)
                           (setq anything-eproject-root-dir (eproject-maybe-turn-on))
                         (setq anything-eproject-root-dir 'nil))))
    (candidates . (lambda () (if anything-eproject-root-dir
                                 (mapcar 'buffer-name 
                                         (cdr (assoc anything-eproject-root-dir 
                                                     (eproject--project-buffers)))))))
    (volatile)
    (type . buffer))
   "Search for buffers in this project.")


(defun anything-semantic ()
  "`anything' for smeantic tags in current buffer"
  (interactive)
  (anything-other-buffer 'anything-c-source-semantic "*anything-semantic*"))

(defun anything-project-files ()
  "`anything' for source files in current `eproject' project"
  (interactive)
  (anything-other-buffer 'anything-c-source-eproject-files "*eproject-files*"))

(defun anything-project-buffers ()
  "`anything' for buffers oppened in current `eproject' project"
  (interactive)
  (anything-other-buffer 'anything-c-source-eproject-buffers "*eproject-buffers*"))

(defun anything-man-pages ()
  "`anything' for man pages"
  (interactive)
  (anything-other-buffer 'anything-c-source-man-pages "man-pages*"))

(defun anything-todos ()
  (interactive)
  (anything-other-buffer 'anything-c-source-fixme "TODOS*"))

(defun anything-info ()
  (interactive)
  (anything-other-buffer 'anything-c-source-info-pages "anything-info*"))


(fset 'anything-man-pages 'aman)
(fset 'anything-todos 'atodo)
(fset 'anything-info 'ainfo)

(global-set-key (kbd "C-x m") 'anything-semantic)
(global-set-key (kbd "C-x C-g") 'anything-project-files)
(global-set-key (kbd "C-x C-b") 'anything-project-buffers)
