(add-to-list 'load-path (concat CFG-DIR "/cedet/ede"))
(require 'ede-cpp-root)

(defclass my-cpp-root-project (ede-cpp-root-project)
  ((project-files-regex
    :initarg :project-files-regex
    :initform '("\\.c$" "\\.h$" "\\.cpp$" "\\.cxx$" "\\.hxx$" "\\.S$" "\\.s$")
    :type list
    :documentation "File patterns that are included into the project")
   (exclude-dirs
    :initarg :exclude-dirs
    :initform nil
    :type list))
  :method-invocation-order :depth-first)

(defmethod initialize-instance ((this my-cpp-root-project) &rest fileds)
  (call-next-method))

(defclass my-linux-project (my-cpp-root-project)
  ((arch
    :initarg :arch
    :initform ""
    :type string))

  :method-invocation-order :depth-first)

(defmethod initialize-instance ((this my-linux-project) &rest fileds)
  (call-next-method)
  (oset this :system-include-path (append
                                   (mapcar (lambda (x) (concat (ede-project-root-directory this) "include/" x))
                                           '("linux" "asm-generic" "generated")) (oref this :system-include-path)))
  (oset this :spp-table (cons '("__KERNEL__" . 1) (oref this :spp-table)))
  (when (slot-boundp this 'arch)
    (let ((arch-dir (concat (ede-project-root-directory this) "arch")))
      (if (file-exists-p (concat arch-dir "/" (oref this :arch)))
          (loop for file in (directory-files (file-name-as-directory arch-dir))
                when (and (file-directory-p (concat arch-dir "/" file))
                          (not (equal file (oref this :arch)))
                          (not (equal file "."))
                          (not (equal file "..")))
                collect file into exclude-dirs
                finally
                 (oset this :exclude-dirs (append (oref this :exclude-dirs)
                                                  (mapcar (lambda (x) (concat "/arch/" x)) exclude-dirs)))
                 (oset this :system-include-path (cons
                                                  (concat arch-dir "/" (oref this :arch) "/include")
                                                  (oref this :system-include-path))))
        (error "Directory %s doesn't exists" (oref this arch))))))

(provide 'project-types)
