;; charcoal-theme.el --- Dark charcoal theme with modifications
;; Author: Elena Williams
;; URL: http://github.com/elena/.emacs/tree/master/charcoal-theme.el
;; Package-Version: 20180714.2209
;; Version: 0.3

;; Remix of several historical charcoal themes with blues, greens and greys
;; Copyright (C) 2018, Elena Williams (such GPL)

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

(deftheme blue-charcoal-theme)

(custom-theme-set-faces
  'blue-charcoal-theme
        '(default ((t (:background "#191919" :foreground "#c2c2c2"))))
        '(font-lock-builtin-face ((t (:foreground "#54686d"))))
        '(region ((t (:background "#3c414c" :foreground "#faf4c6"))))
        '(highlight ((t (:foreground "#d5dd83" :background "#191919"))))
	'(hl-line ((t (:background "#252525"))))
	'(fringe ((t (:background "#232323" :foreground "#8aa234"))))
	'(cursor ((t (:background "#626262"))))
        '(show-paren-match-face ((t (:background "#f03f3f"))))
        '(isearch ((t (:bold t :foreground "#f03f3f" :background "#e2e2e5"))))
        '(mode-line ((t (:box (:line-width 1 :color nil :style released-button) :bold t :foreground "#babdb6" :background "#202020"))))
        '(mode-line-inactive ((t (:box (:line-width 1 :color nil :style released-button) :foreground "#808080" :background "#2b2b2b"))))
        '(mode-line-buffer-id ((t (:bold t :foreground "#5d90cd" :background nil))))
	'(mode-line-highlight ((t (:background "#808080"))))
	'(vertical-border ((t (:foreground "#232323"))))
        '(minibuffer-prompt ((t (:bold t :foreground "#708090"))))
        '(default-italic ((t (:italic t))))
	'(font-lock-builtin-face ((t (:foreground "aquamarine"))))
	'(font-lock-comment-face ((t (:foreground "#808080"))))
	'(font-lock-constant-face ((t (:foreground "pale green"))))
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
	'(slime-repl-inputed-output-face ((t (:foreground "#f0f0f0")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;; charcoal-theme.el ends here
