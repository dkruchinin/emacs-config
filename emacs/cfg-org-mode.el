(require 'org-install)

(defun gtd ()
    (interactive)
    (find-file "~/.org/gtd.org"))

(global-set-key (kbd "C-c C-g") 'gtd)

(defvar ORGS (list "gtd.org" "notes.org" "longterm.org" "inbox.org"))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(custom-set-variables
 '(org-log-done t)
 '(org-use-tag-inheritance t)
 '(org-agenda-tags-todo-honor-ignore-options)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-show-all-dates t)
 '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
 '(org-agenda-todo-ignore-deadlines t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")
 '(org-use-fast-todo-selection t)
 '(org-agenda-window-setup 'current-window)
 '(transient-mark-mode t)
 '(org-directory "~/.orgfiles")
 '(org-agenda-files (quote ("~/.orgfiles/gtd.org"))))

;; Highlight text chosen in with Mark region
(setq org-tag-alist (quote
                     ((:startgroup)
                      ("@work" . ?w)
                      ("@edu"  . ?e)
                      ("@college" . ?l)
                      ("@st"   . ?s)
                      (:endgroup)
                      (:startgroup)
                      ("XRIO" . ?x)
                      ("NEXENTA" . ?n)
                      (:endgroup)
                      ("PROJECT" . ?p)
                      ("MATH" . ?m)
                      ("CS" . ?c)
                      ("HOME" . ?h)
                      ("READING" . ?r))))

(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" 
                                    "DONE(d)" "CANCELLED(c)" "|" "DEFERRED(f)")))

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
      (quote (("n" "Nexenta"
               ((agenda "")
                (tags "LEVEL>1+@work+NEXENTA+PROJECT"
                           ((org-agenda-overriding-header "Nexenta projects")))
                (tags-todo "+@work+NEXENTA-PROJECT"
                           ((org-tags-exclude-from-inheritance '("NEXENTA"))
                            (org-agenda-overriding-header "Nexenta tasks")))))

              ("x" "Xrio"
               ((agenda "")
                (tags "LEVEL>1+@work+XRIO+PROJECT"
                           ((org-agenda-overriding-header "Xrio projects")))
                (tags-todo "+@work+XRIO-PROJECT"
                           ((org-tags-exclude-from-inheritance '("XRIO"))
                            (org-agenda-overriding-header "Xrio tasks")))))
              ("c" "College"
               ((agenda "")
                (tags "LEVEL>1+@college+PROJECT"
                      ((org-agenda-overriding-header "College projects")))
                (tags-todo "+@college-PROJECT"
                           ((org-agenda-overriding-header "College tasks")))))

              ("s" "Spare time"
               ((agenda "")
                (tags "LEVEL>1+@st+PROJECT"
                      ((org-agenda-overriding-header "Spare time projects")))
                (tags-todo "+@st-PROJECT"
                           ((org-agenda-overriding-header "Spare time tasks")))))

              ("H" "Office and Home Lists"
               ((agenda)
                (tags-todo "WORK")
                (tags-todo "HOME")
                (tags-todo "EDU")
                (tags-todo "PROGRAMMING")
                (tags-todo "READING")
                (tags-todo "ST")))
              )))

;; Make windmove work in org-mode:
(add-hook 'org-mode-hook
          (lambda ()
            (org-defkey org-mode-map [(shift up)] 'windmove-up)
            (org-defkey org-mode-map [(shift left)] 'windmove-left)
            (org-defkey org-mode-map [(shift down)] 'windmove-down)
            (org-defkey org-mode-map [(shift right)] 'windmove-right)
            ))

(defun open-main-orgfile ()
  (find-file "~/.orgfiles/gtd.org"))

(defun is-org-buffer (buf)
  (let ((mmode (devlib/buffer-major-mode buf)))
    (or (eq mmode 'org-mode)
        (eq mmode 'org-agenda-mode))))

(defun make-org-frame ()  
  "Create a dedicated frame for org-mode"
  (interactive)
  (make-frame (quote ((name . "ORG")
                      (title . "ORG")
                      (unsplittable . nil)
                      (buffer-predicate . is-org-buffer))))
  (select-frame-by-name "ORG")
  (open-main-orgfile))

;; for agenda
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)
