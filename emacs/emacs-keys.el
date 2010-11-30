;; Common keys that should be used for the same purpose
;; in all development modes.

(defconst EDK-COMPLETE (kbd "<M-tab>"))
(defconst EDK-JUMP2MODULE (kbd "\C-c <return>"))
(defconst EDK-DESCRIBE-METHOD (kbd "\C-s"))
(defconst EDK-SHOW-PROTOTYPE (kbd "\C-c p"))
(defconst EDK-NARROW-TO-METHOD (kbd "\C-x n f"))
(defconst EDK-COMPILE (kbd "<f8>"))
(defconst EDK-METHODS-SUMMARY (kbd "\C-c e"))
(defconst EDK-FUNCTION-DOC (kbd "\C-x d"))
(defconst EDK-DOC-INDEX (kbd "\C-x t"))
(defconst EDK-REPL (kbd "\C-c \C-r"))

(provide 'emacs-keys)
