(require 'anything)
(require 'anything-config)
(require 'compile)
(require 'myede)

(defvar anything-ede-project-files
  '((name . "Files in current project")
    (init . nil)
    (candidates . my/ede-list-project-files)
    (type . file))
  "Search for files in current EDE project.")

(defvar anything-ede-project-buffers
  '((name . "Buffers in current project")
    (init . nil)
    (candidates . (lambda () (mapcar 'buffer-name (my/ede-project-buffers))))
    (volatile)
    (type . buffer))
   "Search for buffers in current EDE project.")

(defun anything-project-files ()
  (interactive)
  (anything-other-buffer 'anything-ede-project-files "*ede-project-files*"))

(defun anything-project-buffers ()
  (interactive)
  (anything-other-buffer 'anything-ede-project-buffers "*ede-project-buffers*"))

(global-set-key (kbd "C-x C-g") 'anything-project-files)
(global-set-key (kbd "C-x C-b") 'anything-project-buffers)
(global-set-key (kbd "<f7>") 'my/ede-compile)
(global-set-key (kbd "<f8>") '(lambda () (mycompile compile-command)))

(load-file (concat CFG-DIR "/projects.el"))

