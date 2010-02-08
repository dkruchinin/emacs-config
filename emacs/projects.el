;; my projects

(ede-cpp-root-project
 "mstring"
 :name "Mstrin microkernel"
 :local-variables (list
                   (cons 'build-command 'my/compile-make)
                   (cons 'clean-command 'my/clean-make)
                   (cons 'c-basic-offset 2))
 :file "~/work/altell/mstring/Makefile")

(ede-cpp-root-project
 "seos"
 :name "SeOS"
 :local-variables (list
                   (cons 'build-command 'my/compile-make)
                   (cons 'clean-command 'my/clean-make)
                   (cons 'c-basic-offset 2))
 :system-include-path '("~/work/altell/seos/include/syslibs")
 :file "~/work/altell/seos/Makefile")

(defun my/ede-get-local-var (var)
  (let ((prj (ede-current-project)))
    (when prj
      (let* ((ov (oref prj local-variables))
             (lst (assoc var ov)))
        (when lst
          (cdr lst))))))

(defun my/ede-get-root-dir ()
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir)))
    (ede-project-root-directory prj)))


(defun my/compile-make ()
  (concat "cd " (my/ede-get-root-dir) "; make"))

(defun my/clean-make ()
  (concat "cd " (my/ede-get-root-dir) "; make clean"))

(defun my/compile-common (var)
  (let* ((x (my/ede-get-local-var var))
         (cmd (if (functionp x) (funcall x) x)))
    (message cmd)
    (when cmd
      (compile cmd))))

(defun my/compile ()
  (interactive)
  (save-some-buffers t)
  (my/compile-common 'build-command))

(defun my/clean ()
  (interactive)
  (save-some-buffers t)
  (my/compile-common 'clean-command))

(global-set-key [f8] 'my/compile)
(global-set-key [f9] 'my/clean)
