;; perl configuration

(require 'emacs-devtools)
(require 'emacs-keys)

(add-to-list 'load-path (concat CFG-DIR "/pde"))
(load "pde-load")

(defun perl-tree-toggle ()
  "Show/hide PDE Imenu tree window"
  (interactive)
  (let ((pde-buf (get-buffer pde-imenu-tree-buffer)))
    (if pde-buf
        (progn
          (delete-windows-on pde-buf)
          (kill-buffer pde-buf))
      (pde-imenu-tree (pde-imenu-tree-create-buffer)))))

(defun perldoc-tree-toggle ()
  "Show/hide PDE perldoc imenu tree"
  (interactive)
  (let ((perldoc-buf (get-buffer perldoc-tree-buffer)))
    (if perldoc-buf
        (progn
          (delete-windows-on perldoc-buf)
          (kill-buffer perldoc-buf))
      (perldoc-tree))))

(require 'cperl-mode)
(add-to-list 'cperl-style-alist
             '("dk"
               (cperl-auto-newline                         . nil) ;; disable annoying auto newlines
               (cperl-indent-level                         . 4)
               (cperl-brace-offset                         . 0)
               (cperl-continued-brace-offset               . -4)
               (cperl-label-offset                         . -4)
               (cperl-continued-statement-offset           . 4)
               (cperl-extra-newline-before-brace           . t)
               (cperl-extra-newline-before-brace-multiline . t)
               (cperl-merge-trailing-else)))

(defun my-perl-hook ()
  (require 'perl-completion)
  (perl-completion-mode t)

  (local-set-key EDK-METHODS-SUMMARY 'perl-tree-toggle)
  (local-set-key EDK-COMPLETE 'plcmp-cmd-smart-complete)
  (local-set-key EDK-FUNCTION-DOC 'perldoc)
  (local-set-key EDK-DOC-INDEX 'perldoc-tree-toggle)
  (local-set-key EDK-REPL 'inf-perl-start)

  (cperl-set-style "dk"))

;; PDE's cperl-mode-hook sets "PDE" coding style as default one.
;; The only way to avoid using "PDE" coding style every time cperl-mode
;; is used is to APPEND my own hook that resets crappy PDE style to my nice one.
(add-hook 'cperl-mode-hook 'my-perl-hook t)
(add-hook 'perldoc-mode-hook '(lambda ()
                                (local-set-key EDK-DOC-INDEX 'perldoc-tree-toggle)))

;; cperl-mode and perldoc-mode faces
(custom-set-faces
 '(cperl-array-face ((t (:foreground "#b76a4f" :italic t :bold nil))))
 '(cperl-hash-face  ((t (:foreground "#4fb7ac" :italic t :bold nil))))
 '(cperl-nonoverridable-face ((t (:foreground "#209631"))))
 '(perldoc-directory-face ((t (:foreground "IndianRed3")))))
