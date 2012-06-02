(add-to-list 'load-path (concat-path PLUGINS-DIR "js2-mode"))
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Node.js REPL
(require 'js-comint)
(setq inferior-js-program-command "node")
(setq js2-basic-offset 4)
(setq js2-cleanup-whitespace t)

(add-hook 'js2-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
                     (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))

;; Custom indentation function since JS2 indenting is terrible.
;; Uses js-mode's (espresso-mode) indentation semantics.
;;
;; Based on: http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
;; (Thanks!)
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status))
           node)

      (save-excursion
        (back-to-indentation)
        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-js2-mode-hook ()
  (if (not (boundp 'js--proper-indentation))
      (progn (js-mode)
             (remove-hook 'js2-mode-hook 'my-js2-mode-hook)
             (js2-mode)
             (add-hook 'js2-mode-hook 'my-js2-mode-hook)))
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (message "JS2 mode hook ran."))

;; Add the hook so this is all loaded when JS2-mode is loaded
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
