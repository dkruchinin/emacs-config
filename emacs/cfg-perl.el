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

(defun perl-completion-hook ()
  (require 'perl-completion)
  (perl-completion-mode t)

  (local-set-key EDK-METHODS-SUMMARY 'perl-tree-toggle)
  (local-set-key EDK-COMPLETE 'plcmp-cmd-smart-complete)
  (local-set-key EDK-FUNCTION-DOC 'perldoc)
  (local-set-key EDK-DOC-INDEX 'perldoc-tree-toggle))

(add-hook 'cperl-mode-hook 'perl-completion-hook)
(add-hook 'perldoc-mode-hook '(lambda ()
                                (local-set-key EDK-DOC-INDEX 'perldoc-tree-toggle)))

;; cperl-mode and perldoc-mode faces
(custom-set-faces
 '(cperl-array-face ((t (:foreground "#b76a4f" :italic t :bold nil))))
 '(cperl-hash-face  ((t (:foreground "#4fb7ac" :italic t :bold nil))))
 '(cperl-nonoverridable-face ((t (:foreground "#209631"))))
 '(perldoc-directory-face ((t (:foreground "IndianRed3")))))
