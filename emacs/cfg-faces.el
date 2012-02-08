;; Standard faces
(add-to-list 'load-path (concat-path CFG-DIR "/color-themes"))
(require 'color-theme)
(require 'color-theme-dk)

(defconst DEFAULT-FONT "-apple-Inconsolata-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")

(set-default-font DEFAULT-FONT)
(when (boundp 'aquamacs-version)
  ;;
  ;; The latest Aquamacs has some problems with inhereting
  ;; the default font by minibuffer and modeline faces.
  ;; To fix that problem, we set the font of enumerated below
  ;; faces explicitly.
  ;;
  (mapcar #'(lambda (face) (set-face-font face DEFAULT-FONT))
          '(echo-area
            minibuffer
            minibuffer-prompt
            aquamacs-variable-width
            mode-line
            mode-line-inactive
            mode-line-flags
            mode-line
            mode-line-buffer-id
            mode-line-emphasis
            mode-line-highlight)))

(color-theme-dk)


