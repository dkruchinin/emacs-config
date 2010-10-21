;; Standard faces

;;(defconst DEFAULT-FONT "DejaVu Sans Mono-9")
(defconst DEFAULT-FONT "Liberation Mono-10")

(when window-system
  (set-default-font DEFAULT-FONT))

(if (display-graphic-p)
  (set-fontset-font (frame-parameter nil 'font) 'han '("STHeiti" . "unicode-bmp")))
;;(set-face-attribute 'mode-line nil :box nil)

(set-face-attribute 'vertical-border nil :foreground "#111111")

(custom-set-faces
;; A bit modified color theme originally created by djcb
 '(default ((t (:foreground "#a9eadf" :background "black"))))
 '(font-lock-builtin-face ((t (:italic t :foreground "#a96da0"))))
 '(font-lock-comment-face ((t (:italic t :foreground "#bbbbbb"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#666666"))))
 '(font-lock-constant-face ((t (:bold t :foreground "#a54fb7"))))
 '(font-lock-doc-string-face ((t (:foreground "#3041c4"))))
 '(font-lock-doc-face ((t (:foreground "gray"))))
 '(font-lock-reference-face ((t (:foreground "white"))))
 '(font-lock-function-name-face ((t (:foreground "#7685de"))))
 '(font-lock-keyword-face ((t (:bold t :foreground "#ae3535"))))
 '(font-lock-preprocessor-face ((t (:foreground "#e3ea94"))))
 '(font-lock-string-face ((t (:foreground "#ffffff"))))
 '(font-lock-type-face ((t (:bold t :foreground "#5fb765"))))
 '(font-lock-variable-name-face ((t (:foreground "#4177a0"))))
 '(font-lock-warning-face ((t (:bold t :italic nil :underline nil 
                                     :foreground "yellow"))))
 '(hl-line ((t (:background "#112233"))))
 '(mode-line ((t (:foreground "#ffffff" :background "#333333"))))
 '(region ((t (:foreground nil :background "#555555"))))
 '(cursor ((t (:background "steelblue3"))))
;;
;; Paren match and mismatch faces
;; 
 '(show-paren-match ((t (:foreground "#e8990f" :bold t))))
 '(show-paren-mismatch ((t (:background "darkred" :foreground "yellow" :bold t))))
;;
;; Minibuffer and ido-mode settings
;;
 '(minibuffer-prompt ((t (:foreground "SteelBlue"))))
 '(ido-only-match ((t (:foreground "#38ae43"))))
 '(ido-first-match ((t (:foreground "#c1a075"))))
 '(ido-subdir ((t (:foreground "#b775c1"))))
 
 '(completions-common-part ((t (:foreground "DarkGreen"))))
 '(completions-first-difference ((t (:foreground "DarkRed"))))
;;
;; Whitespace mode faces
;;
 '(whitespace-trailing ((t (:background "IndianRed"))))
;;
;; Company-mode faces
;;
 '(company-preview-common ((t (:foreground "green3"))))
 '(company-tooltip ((t (:foreground "black" :background "LightSteelBlue1"))))
 '(company-tooltip-common ((t (:foreground "DarkGreen" :background "LightSteelBlue1"))))
 '(company-tooltip-selection ((t (:foreground "blue4" :background "LightSteelBlue1"))))
 '(company-tooltip-common-selection ((t (:foreground "DarkRed" :background "LightSteelBlue1"))))
;;
;; WoMan faces
;;
 '(woman-bold ((t (:foreground "IndianRed3" :weight normal))))
 '(woman-italic ((t (:foreground "green4" :slant italic))))
 '(woman-unknown ((t (:foreground "IndianRed3" :weight normal :background "#0b0b0b"))))
;;
;; ECB faces
;;
 '(ecb-default-highlight-face 
  ((((class color) (background dark)) (:background "#463524"))))
 '(ecb-mode-line-prefix-face 
   ((((class color) (background dark)) (:foreground "forestgreen")))))

