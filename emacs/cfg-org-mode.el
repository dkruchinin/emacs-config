(require 'org-install)
(defvar ORGS (list "CS" "english" "math" "physics"))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files
      (mapcar #'(lambda (x) (concat "~/.orgs/" x "/tasks.org"))
              ORGS))
(setq org-todo-keywords '((sequence "TODO(t)" "ACTIVE(a)" "|" "DONE(d)")
                          (sequence "|" "CANCELED(c)")))