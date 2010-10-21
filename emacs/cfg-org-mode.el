(require 'org-install)
(defvar ORGS (list "gtd.org" "notes.org" "longterm.org" "inbox.org"))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(custom-set-variables
 '(org-log-done t)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
 '(org-agenda-todo-ignore-deadlines t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-window-setup (quote other-window))
 '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")
 '(org-use-fast-todo-selection t)
 '(org-use-tag-inheritance nil)
 '(org-mobile-directory "/var/www/dav/org")
 '(org-mobile-files '("gtd.org" "inbox.org" "goalsheet.org"))
 '(org-mobile-inbox-for-pull "~/.org/mobile-inbox.org"))

(setq org-agenda-files
      (mapcar #'(lambda (x) (concat "~/.org/" x))
              ORGS))

;; Highlight text chosen in with Mark region
(transient-mark-mode t)
(setq org-directory "~/.org/")
(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
     '(
      ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "c:/charles/GTD/newgtd.org" "Tasks")
      ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "C:/charles/gtd/privnotes.org")
      ("WordofDay" ?w "\n* %^{topic} \n%i%?\n" "C:/charles/gtd/wotd.org")
      ))

(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))

(setq org-agenda-custom-commands
'(

("P" "Projects"   
((tags "PROJECT")))

("H" "Office and Home Lists"
     ((agenda)
          (tags-todo "WORK")
          (tags-todo "HOME")
          (tags-todo "EDU")
          (tags-todo "PROGRAMMING")
          (tags-todo "READING")
          (tags-todo "ST")))

("D" "Daily Action List"
 (
  (agenda "" ((org-agenda-ndays 1)
              (org-agenda-sorting-strategy
               (quote ((agenda time-up priority-down tag-up) )))
              (org-deadline-warning-days 0)
              ))))))

(defun gtd ()
    (interactive)
    (find-file "~/.org/gtd.org"))

(global-set-key (kbd "C-c C-g") 'gtd)

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-hook 'windmove-up)
(add-hook 'org-shiftleft-hook 'windmove-left)
(add-hook 'org-shiftdown-hook 'windmove-down)
(add-hook 'org-shiftright-hook 'windmove-right)
