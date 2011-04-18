(require 'dired)
(require 'yasnippet)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'fic-ext-mode)

(defvar dir-locals-root nil)
(make-variable-buffer-local 'dir-locals-root)

(defun devlib/filter (predicate seq)
  (cond ((null seq) nil)
        ((funcall predicate (car seq))
         (cons (car seq)
               (devlib/filter predicate (cdr seq))))
        (t
         (devlib/filter predicate (cdr seq)))))

(defun devlib/directory-directories (root-dir &optional full match nosort)
  (let ((dir (file-name-as-directory root-dir)))
    (devlib/filter #'(lambda (file) (file-directory-p (concat dir file)))
                       (directory-files dir full match nosort))))

(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))

(defun gtags-update ()
  "Make GTAGS incremental update"
  (call-process "global" nil nil nil "-u"))

(provide 'devlib)