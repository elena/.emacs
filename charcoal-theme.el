;; charcoal-theme.el --- Dark charcoal theme with modifications

;; Author: Elena Williams
;; URL: http://github.com/elena/.emacs/tree/master/charcoal-theme.el
;; Package-Version: 20220804.0333
;; Version: 0.4

;; Remix of several historical charcoal themes with blues, greens and greys
;; Copyright (C) 2022, Elena Williams (such GPL)

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; GNU General Public License, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.
;; line numbers
;; ========================================
;; `(linum ((t (:foreground ,my-deepcontrast ))))
;; `(line-number ((t (:foreground ,my-deepcontrast ))))
;; `(sp-show-pair-match-face ((t (:background ,my-active :height 1.25 :weight extra-bold ))))
;; `(sp-show-pair-mismatch-face ((t (:background ,my-warning :weight extra-bold ))))
;; `(sp-pair-overlay-face ((t (:background ,my-contrast ))))


(deftheme charcoal "Dark charcoal with blue-ish modifications")

(let* ((class '((class color) (min-colors 89)))
       (256color  (eq (display-color-cells (selected-frame)) 256))
       (truecolor (eq (display-color-cells (selected-frame)) 16777216))

       (background (if (or window-system truecolor) "#263238" "#262626")) ;; sidebar-container
       (current-line (if (or window-system truecolor)  "#37474f" "#3a3a3a")) ;; tree-row
       (far-background (if (or window-system truecolor)  "#1c1f26" "#121212")) ;; panel-control
       (diff-nonactive-bg "#2F3D41")
       (diff-current-A-bg "#40393D")
       (diff-fine-A-bg "#784948")
       (diff-current-B-bg "#203B4A")
       (diff-fine-B-bg "#155378")
       (diff-current-C-bg "#33453A")
       (diff-fine-C-bg "#4F6C3F")
       (diff-current-ancestor-bg "#203B4A")
       (diff-fine-ancestor-bg "#155378")
       (inactive-gray (if (or window-system truecolor) "#78909c" "#8a8a8a"))
       (header-color (if (or window-system truecolor) "#455A64" "#5f5f5f"))
       (subtle "#a7adba") ;; tree-row-hover-disclosure-button-control
       (selection "#555555") ;; tab-control-dirty-tab-close-button
       (secondary-selection "#bf616a") ;; tab-control-hover-tab-close-button
       (foreground "#ffffff")
       (comment "#b0bec5") ;; table-row
       (red "#f36c60") ;; tab-control-hover-tab-close-button
       (orange "#ff9800") ;; darker tab-control-dirty-tab-close-butto
       (yellow "#fff59d") ;; tab-control-dirty-tab-close-button
       (green "#8bc34a") ;; complement tab-control-dirty-tab-close-button
       (aqua "#81d4fa") ;; lighter complement tab-control-dirty-tab-close-button
       (blue "#4dd0e1") ;; complement tab-control-dirty-tab-close-button
       (purple "#b39ddb")) ;; complement tab-control-dirty-tab-close-button
  )

(custom-theme-set-faces
 'charcoal
 ;; '(default ((t (:background "#191919" :foreground "#cacaca" :height 90 :family "DejaVu Sans Mono"))))
 ;;'(default ((t (:background "#191919" :foreground "#cacaca" :height 90 :family "Oxygen Mono"))))
 '(default ((t (:background "#191919" :foreground "#cacaca" :height 90 :family "Monospace"))))
 '(font-lock-builtin-face ((t (:foreground "#54686d"))))
 '(region ((t (:background "#3c414c" :foreground "#faf4c6"))))
 '(highlight ((t (:foreground "#d5dd83" :background "#191919"))))
 '(hl-line ((t (:background "#252525"))))
 '(fringe ((t (:background "#232323" :foreground "#8aa234"))))
 '(cursor ((t (:background "#626262"))))
 '(show-paren-match-face ((t (:background "#f03f3f"))))
 '(isearch ((t (:bold t :foreground "#f03f3f" :background "#e2e2e5"))))
 '(mode-line ((t (:box (:line-width 1 :color nil :style released-button) :bold t :foreground "#303030" :background "#fff3e1"))))
 '(mode-line-inactive ((t (:box (:line-width 1 :color nil :style released-button) :foreground "#808080" :background "#2b2b2b"))))
 '(mode-line-buffer-id ((t (:bold t :foreground "#5d90cd" :background nil))))
 '(mode-line-highlight ((t (:background "#191919"))))
 '(vertical-border ((t (:foreground "#232323"))))
 '(minibuffer-prompt ((t (:bold t :foreground "#708090"))))
 '(default-italic ((t (:italic t))))
 '(font-lock-builtin-face ((t (:foreground "aquamarine1"))))
 '(font-lock-comment-face ((t (:foreground "#808080"))))
 '(font-lock-constant-face ((t (:foreground "pale green"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#708090"))))
 '(font-lock-preprocessor-face ((t (:foreground "pale green"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "aquamarine"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "aquamarine3"))))
 '(font-lock-doc-face ((t (:foreground "light sky blue"))))
 '(font-lock-doc-string-face ((t (:foreground "sky blue"))))
 '(font-lock-function-name-face ((t (:bold t :foreground "aquamarine" :weight bold))))
 '(font-lock-keyword-face ((t (:bold t :foreground "aquamarine4" :weight bold))))
 '(font-lock-negation-char-face ((t (:foreground "#f03f3f"))))
 '(font-lock-reference-face ((t (:bolf t :foreground "pale green"))))
 '(font-lock-string-face ((t (:foreground "light sky blue"))))
 '(font-lock-type-face ((t (:bold t :foreground "sky blue" :weight bold))))
 '(font-lock-variable-name-face ((t (:bold t :foreground "turquoise" :weight bold))))
 '(font-lock-warning-face ((t (:bold t :foreground "Red" :weight bold))))
 `(show-paren-mismatch ((t (:foreground, "red" :weight bold))))
 `(show-paren-match ((t (:foreground, "white" :weight bold))))
 `(lazy-highlight ((t (:foreground, "white"))))
 `(line-number-current-line ((t (:foreground, "white" ))))
 `(trailing-whitespace ((t (:background, "555555" ))))
 `(dired-header ((t (:foreground, "white" ))))

 '(link ((t (:foreground "#ffc01a"))))
 '(org-hide ((t (:foreground "#708090"))))
 '(org-level-1 ((t (:bold t :foreground "#54686d" :height 1.1))))
 '(org-level-2 ((t (:bold nil :foreground "#7e8aa2"))))
 '(org-level-3 ((t (:bold t :foreground "#df9f2d"))))
 '(org-level-4 ((t (:bold nil :foreground "#af4f4b"))))
 '(org-date ((t (:underline t :foreground "#f0ad6d") )))
 '(org-footnote  ((t (:underline t :foreground "#ad600b"))))
 '(org-link ((t (:underline t :foreground "#ffc01a" ))))
 '(org-special-keyword ((t (:foreground "#8aa234"))))
 '(org-verbatim ((t (:foreground "#eeeeec" :underline t :slant italic))))
 '(org-block ((t (:foreground "#7e8aa2"))))
 '(org-quote ((t (:inherit org-block :slant italic))))
 '(org-verse ((t (:inherit org-block :slant italic))))
 '(org-todo ((t (:bold t :foreground "#f0f0f0"))))
 '(org-done ((t (:bold t :foreground "#708090"))))
 '(org-warning ((t (:underline t :foreground "#ff0000"))))
 '(org-agenda-structure ((t (:weight bold :foreground "#e3e3e3"))))
 '(org-agenda-date ((t (:foreground "#8aa234" :height 1.2))))
 '(org-agenda-date-weekend ((t (:weight normal :foreground "#808bed"))))
 '(org-agenda-date-today ((t (:weight bold :foreground "#8aa234" :height 1.4))))
 '(org-scheduled ((t (:foreground "#eeeeec"))))
 '(font-latex-bold-face ((t (:foreground "#cd8b00"))))
 '(font-latex-italic-face ((t (:foreground "#808bed" :italic t))))
 '(font-latex-string-face ((t (:foreground "#708090"))))
 '(font-latex-match-reference-keywords ((t (:foreground "#708090"))))
 '(font-latex-match-variable-keywords ((t (:foreground "#708090"))))
 '(ido-only-match ((t (:foreground "#f03f3f"))))
 '(org-sexp-date ((t (:foreground "#808080"))))
 '(ido-first-match ((t (:foreground "#8aa234"))))
 '(gnus-header-content ((t (:foreground "#e3e3e3"))))
 '(gnus-header-from ((t (:foreground "#54686d"))))
 '(gnus-header-name ((t (:foreground "#5d90cd"))))
 '(gnus-header-subject ((t (:foreground "#b998df"))))
 '(magit-item-highlight ((t (:background "#252525"))))
 '(mu4e-view-url-number-face ((t (:foreground "#af4f4b"))))
 '(mu4e-cited-1-face ((t (:foreground "#a2a1a0"))))
 '(mu4e-cited-7-face ((t (:foreground "#b2b1b0"))))
 '(mu4e-header-marks-face ((t (:foreground "#929190"))))
 '(ffap ((t (:foreground "#929190"))))
 '(trailing-whitespace ((t (:foreground nil :background "#3f3f3f"))))
 '(slime-repl-inputed-output-face ((t (:foreground "#f0f0f0"))))

 ;; `(header-line ((,class (:inherit mode-line :foreground ,purple :background nil))))

 ;; `(trailing-whitespace ((,class (:foreground ,red :inverse-video t :underline nil))))
 ;; `(whitespace-trailing ((,class (:foreground ,red :inverse-video t :underline nil))))
 ;; `(whitespace-space-after-tab ((,class (:foreground ,red :inverse-video t :underline nil))))
 ;; `(whitespace-space-before-tab ((,class (:foreground ,red :inverse-video t :underline nil))))
 ;; `(whitespace-empty ((,class (:foreground ,red :inverse-video t :underline nil))))
 ;; `(whitespace-line ((,class (:background nil :foreground ,red))))
 ;; `(whitespace-indentation ((,class (:background nil :foreground ,aqua))))
 ;; `(whitespace-space ((,class (:background nil :foreground ,selection))))
 ;; `(whitespace-newline ((,class (:background nil :foreground ,selection))))
 ;; `(whitespace-tab ((,class (:background nil :foreground ,selection))))
 ;; `(whitespace-hspace ((,class (:background nil :foreground ,selection))))

 ;; `(markdown-header-face-1 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.3 ))))
 ;; `(markdown-header-face-2 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.2 ))))
 ;; `(markdown-header-face-3 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.1 ))))
 ;; `(markdown-header-face-4 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.1 ))))
 ;; `(markdown-header-face-5 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.1 ))))
 ;; `(markdown-header-face-6 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.1 ))))
 ;; `(markdown-header-face-7 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.1 ))))
 ;; `(markdown-header-face-8 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.1 ))))
 ;; `(markdown-header-face-9 ((,class (:inherit font-lock-function-name-face :weight bold :height 1.1 ))))
 ;; `(markdown-header-delimiter-face ((,class (:inherit font-lock-function-name-face :weight bold
 ;;                                                     :height 1.2))))
 ;; `(markdown-url-face ((,class (:inherit link))))
 ;; `(markdown-link-face ((,class (:foreground ,blue :underline t))))

 ;;                                        ;`(hl-sexp-face ((,class (:background ,current-line))))
 ;; `(highlight-symbol-face ((,class (:background ,selection))))
 ;; `(highlight-80+ ((,class (:background ,current-line))))
 ;; ;; Outline
 ;; `(outline-1 ((,class (:inherit nil :foreground ,"#eceff1"))))
 ;; `(outline-2 ((,class (:inherit nil :foreground ,"#e1f5fe"))))
 ;; `(outline-3 ((,class (:inherit nil :foreground ,"#a5d6a7" ))))
 ;; `(outline-4 ((,class (:inherit nil :foreground ,"#ffcc80" ))))
 ;; `(outline-5 ((,class (:inherit nil :foreground ,"#b3e5fc"))))
 ;; `(outline-6 ((,class (:inherit nil :foreground ,"CadetBlue1"))))
 ;; `(outline-7 ((,class (:inherit nil :foreground ,"aquamarine1"))))
 ;; `(outline-8 ((,class (:inherit nil :foreground ,purple))))
 ;; `(outline-9 ((,class (:inherit nil :foreground ,"LightSteelBlue1"))))
 )


;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'charcoal)

;;; charcoal-theme.el ends here
