;; Common-lisp and emacs-lisp configuration

(require 'emacs-devtools)

;; slime
(add-to-list 'load-path (concat CFG-DIR "/slime"))
(require 'slime)
(add-hook 'inferior-lisp-mode-hook 
          #'(lambda () (inferior-slime-mode t)))
(setenv "SBCL_HOME" "/usr/lib/sbcl")
(custom-set-variables
   '(inferior-lisp-program "/usr/bin/sbcl")
   '(common-lisp-hyperspec-root "/home/dk/lib/lisp/hyperspec/")
   '(slime-startup-anomation nil)
   '(slime-net-coding-system 'utf-8-unix)
   '(slime-backend 
     (concat CFG-DIR "/slime/swank-loader.lisp")))
(slime-setup 
 '(slime-fancy slime-asdf slime-autodoc slime-references))
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(add-hook 'inferior-lisp-mode-hook
          #'(lambda () (inferior-slime-mode t)))
(add-hook 'slime-mode-hook 
          #'(lambda () (slime-autodoc-mode t)))

;; lisp/elisp
(defun my-basic-lisp-hook ()
  (highlight-parentheses-mode)
  (local-set-key [return] 'newline-and-indent))

(mapcar #'(lambda (mode)
            (font-lock-add-keywords
              mode 
              '(("[\s(]+\\(t\\|T\\|NIL\\|nil\\)[\s\n)]+"
                 1 'font-lock-constant-face)
                ("[\s(]+'\\(\\sw+\\)" 1 font-lock-preprocessor-face)))
            (add-mark-kw-hl mode))
        '(lisp-mode emacs-lisp-mode))
(add-to-list 'auto-mode-alist 
             '("\\.emacs$" . emacs-lisp-mode))
(add-hook 'emacs-lisp-mode-hook #'my-basic-lisp-hook)
(add-hook 'lisp-mode-hook 
          #'(lambda ()
              (my-basic-lisp-hook)
              (slime-mode t)
              (local-set-key "\M-s" 
                             'slime-fuzzy-complete-symbol)))
