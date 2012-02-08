;; Fcuntions and keybindings for buffers management

;; Ido
(require 'ido)

(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-save-directory-list-file "~/.emacs.d/cache/ido.last")
 '(ido-ignore-buffers 
   '("\*"))
 '(ido-case-fold t)
 '(ido-enable-last-directory-history t)
 '(ido-use-file-at-point nil)
 '(ido-use-url-at-point nil)
 '(ido-confirm-unique-completion t)
 '(ido-everywhere nil))

(ido-mode)

;; Uniquify
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

;; ibuffer
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Org"
                (mode . org-mode))
               ("Programming"
                (or
                 (mode . c-mode)
                 (mode . c++-mode)
                 (mode . perl-mode)
                 (mode . python-mode)
                 (mode . emacs-lisp-mode)
                 (mode . scheme-mode)
                 (mode . lisp-mode)
                 (name . "^\*compilation")))
               ("Junk"
                (name . "\*"))))))

(add-hook 'ibuffer-mode-hook
          (lambda () 
            (ibuffer-switch-to-saved-filter-groups "default")))

(defun select-buffer-from-ring-ido ()
  "Select buffer from the current buffers ring
   using ido-completing-read function."

  (interactive)
  (if (boundp 'buffer-ring)
      (switch-to-buffer
       (ido-completing-read
        (concat "Ring [" 
                (bfr-ring-name buffer-ring) 
                "] buffers: ")
        (dyn-ring-map (bfr-ring-ring buffer-ring)
                      (lambda (name) name))))
    (message "This buffer is not in a ring.")))

;; sometimes it may be useful to delete selected
;; window and kill buffer it shows with only one function
(defun delete-window-with-buffer ()
"Delete selected window and kill buffer is shows"
  (interactive)
  (kill-buffer (current-buffer))
  (delete-window (selected-window)))

(global-set-key (kbd "\C-c 0") 'delete-window-with-buffer)
(global-set-key [M-f12] 'toggle-mode-line)
