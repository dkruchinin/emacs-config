;; Miscellaneous development helpers initialization

;; Hideshow mode initialization
(load-library "hideshow")
(load-library "hideshowvis")

(define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])

(defcustom hs-fringe-face 'hs-fringe-face
  "*Specify face used to highlight the fringe on hidden regions."
  :type 'face
  :group 'hideshow)

(defface hs-fringe-face
  '((t (:foreground "#e7693e" :box 
                    (:line-width 2 :color "blue" :style released-button))))
  "Face used to highlight the fringe on folded regions"
  :group 'hideshow)

(defcustom hs-face 'hs-face
  "*Specify the face to to use for the hidden region indicator"
  :type 'face
  :group 'hideshow)

(defface hs-face
  '((t (:foreground "#6d7e77" :box nil)))
  "Face to hightlight the ... area of hidden regions"
  :group 'hideshow)

(setq hs-set-up-overlay 'display-code-line-counts)

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (let* ((marker-string "*fringe-dummy*")
           (marker-length (length marker-string))
           (display-string 
            (format "(%d)..." 
                    (count-lines (overlay-start ov) (overlay-end ov)))))
      (put-text-property 0 marker-length 
                         'display 
                         (list 'left-fringe 'hs-marker 'hs-fringe-face) 
                         marker-string)
      (overlay-put ov 'before-string marker-string)
      (put-text-property 0 (length display-string) 
                         'face 'hs-face display-string)
      (overlay-put ov 'display display-string))))

(defun enable-whitespace-mode ()  
  (setq whitespace-style 
        '(lines lines-tail space-after-tab space-before-tab trailing))
  (custom-set-faces
    '(whitespace-line ((t (:foreground "Orange" :background "DarkSlateGray"))))
    '(whitespace-trailing ((t (:background "IndianRed")))))
  (whitespace-mode))

;; Highlite parentheses. Quite useful 
;; minor mode for lisp-like languages
(require 'highlight-parentheses)
(setq hl-paren-colors 
      '("#ef6b00" "#2700ef" "#c117bb"))

;; Keybindings
(global-set-key (kbd "\C-c ;") 'comment-region)
(global-set-key (kbd "\C-c :") 'uncomment-region)
