;; ;; Elena's emacs init

;; ;; emacs usage:
;; ;;
;; ;; ~ python
;; ;;   - django
;; ;;   - scripts
;; ;;
;; ;; ~ web front-end
;; ;;   - html/css/javascript
;; ;;   - php
;; ;;
;; ;; ~ text editing (crazy!)
;; ;;   - rst/markdown
;; ;;
;; ;; ~ org-mode

(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/") t)

(defvar my-packages
  '(
    auto-complete
    better-defaults
    magit
    py-autopep8
    recentf

    ;; auto-complete-config
    ;; exec-path-from-shell
    ;; js3-mode
    ;; markdown-mode
    ;; markdown-preview-mode
    ;; rainbow-delimiters
    ;; web-mode
    ;; yaml-mode
    ;; yasnippet
    ))

(dolist (p my-packages)
  (when (not (require p nil 'noerror))
    (package-install p)))

;; ;; ---------------
;; ;; ===============
;; ;; ** UTILITIES **
;; ;; ===============
;; ;; ---------------
;; ;; The day-to-day stuff can't live without and works universally.
;; ;; Not specific to an application
(setq inhibit-splash-screen t)
(delete-selection-mode 1)
(line-number-mode 1)
(tool-bar-mode -1)
(column-number-mode 1)
(size-indication-mode 1)
(setq find-file-wildcards t)
(setq minibuffer-default-add-shell-commands t)
(setq iswitchb-buffer-ignore '("^\*"))
(setq calendar-latitude -35.17)
(setq calendar-location-name "Sydney")
(setq calendar-longitude 149.08)

;; ;; -----------------------
;; ;; ** Backup management **
;; ;; -----------------------
;; ;; Put `*.*~` files in `~/.saves` rather than throughout my fs
(setq backup-by-copying t
  backup-directory-alist '(("." . "~/.saves"))
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2)

;; ------------
;; ** Recent **
;; ------------
(recentf-mode 1)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 99)
(recentf-mode +1)

;; ;; -----------------
;; ;; =================
;; ;; ** CONVENIENCE **
;; ;; =================
;; ;; -----------------
;; ;; Niceties not specific to an application.

;; ;; ------------------
;; ;; * Linux specific *
;; ;; ------------------

(set-default-font "Monospace-9")
;; (set-default-font "Mono-8")
;; (set-default-font "Ubuntu Mono-10")
;; (set-default-font "Liberation Mono-9")
;; (set-default-font "DejaVu Sans Mono-9")
;; (set-default-font "Monaco Regular-10")
;; (set-default-font "Nimbus Mono")
;; (set-default-font "ProggyClean-11:bold")
;; (set-default-font "Monaco Regular-10")

;; ----------------
;; * OSX specific *
;; ----------------
;; (set-keyboard-coding-system nil)
;; (setq mac-command-modifier 'meta)
;; (set-default-font "Menlo-10")

;; --------------------
;; * Windows specific *
;; --------------------
;; set default size to maximum window
;; (defun w32-maximize-frame ()
;;   "Maximize the current frame"
;;   (interactive)
;;   (w32-send-sys-command 61488))
;; (set-default-font "ProggyCleanTT CE-11:bold")
;; (set-default-font "DejaVu Sans Mono-9")

;; ------------------
;; ** Key-Bindings **
;; ------------------
;; Additional bindings that make me happy.
(global-set-key "\C-c\ \C-e" 'load-file)
(global-set-key "\C-c\ #" 'comment-region)
(global-set-key "\C-x\ #" 'uncomment-region)
(global-set-key (kbd "C-x ^")  'delete-indentation)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key "\C-c\ \C-a" 'auto-complete-mode)
(global-set-key "\M-n" 'next-error)
(global-set-key "\M-p" 'previous-error)
;; below the fold
(global-set-key "\C-c\ o" 'org-iswitchb)
(global-set-key "\C-c\ a" 'org-agenda)
(global-set-key "\C-c\ l" 'org-store-link)
(global-set-key "\C-\M-r" 'remember)
(global-set-key "\C-x\ g" 'magit-status)


;; Save RSI by while in god-mode to assume \C- prefix 
;; see: https://github.com/chrisdone/god-mode/
(require 'god-mode)
(global-set-key (kbd "<f9>") 'god-mode-all)
(define-key god-local-mode-map (kbd ".") 'repeat)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)

;; -------------------
;; ** Auto-Complete **
;; -------------------
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(global-auto-complete-mode t)

;; ;; -----------------------------------
;; ;; ** Interactively Do Things (ido) **
;; ;; -----------------------------------
;; (setq ido-enable-flex-matching t)
;;   (setq ido-everywhere t)
;;   (ido-mode 1)

;; ;; Snippets
;; ;; --------
;; (setq yas/prompt-functions '(yas/ido-prompt
;;                              yas/completing-prompt))

;; Beginning of indent
;; -------------------
(defun beginning-of-line-or-indentation ()
  "Move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))
(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)

;; Duplicate Line
;; --------------
(defun duplicate-line ()
  "Clone line at cursor, leaving the latter intact."
  (interactive "*")
  (save-excursion
    ;; The last line of the buffer cannot be killed
    ;; if it is empty. Instead, simply add a new line.
    (if (and (eobp) (bolp))
        (newline)
      ;; Otherwise kill the whole line, and yank it back.
      (let ((kill-read-only-ok t)
            deactivate-mark)
        (toggle-read-only 1)
        (kill-whole-line)
        (toggle-read-only 0)
        (yank)))))
(global-set-key (kbd "C-c d") 'duplicate-line)


;; Insert date and time
;; --------------------

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       (insert "==========\n")
;       (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       (insert "\n")
       )

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n")
       )

(global-set-key "\C-c \C-d" 'insert-current-date-time)
(global-set-key "\C-c \C-t" 'insert-current-time)


;; -------------
;; ** Display **
;; -------------


;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

(global-hl-line-mode t) ;; To enable
(set-face-background 'hl-line "grey19") ;; change with the color that you like
                                       ;; for a list of colors: http://raebear.net/comp/emacscolors.h
;; Theme
;; --------------------------------------

(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-charcoal-black)


;; the fold ---------------------------------------------------------------------
;; ==============================================================================
;; application specific configuration -------------------------------------------

;; -----------------
;; =================
;; **  Python     **
;; =================
;; -----------------

(elpy-enable)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)


;; -----------------
;; =================
;; **  todo.txt   **
;; =================
;; -----------------

;(find-file "~/Dropbox/td/todo.htm")

;; ;; -----------------
;; ;; =================
;; ;; **  Org        **
;; ;; =================
;; ;; -----------------

;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (setq org-log-done 'time)
;; (setq org-agenda-files (quote ("~/Google Drive/td.htm")))
;; (setq org-agenda-ndays 7)
;; (setq org-agenda-show-all-dates t)
;; (setq org-agenda-skip-deadline-if-done t)
;; (setq org-agenda-skip-scheduled-if-done t)
;; (setq org-agenda-start-on-weekday nil)
;; (setq org-deadline-warning-days 14)
;; (setq org-default-notes-file "~/notes.org")
;; (setq org-fast-tag-selection-single-key (quote expert))
;; (setq org-remember-store-without-prompt t)
;; (setq org-reverse-note-order t)
;; (setq remember-annotation-functions (quote (org-remember-annotation)))
;; (setq remember-handler-functions (quote (org-remember-handler)))
;;  ;; syntax incorrect -- need to have in 'setq'
;;  '(org-agenda-custom-commands (quote (
;;    ("d" todo "DELEGATED" nil)
;;    ("c" todo "DONE|DEFERRED|CANCELLED" nil)
;;    ("w" todo "WAITING" nil)
;;    ("W" agenda "" ((org-agenda-ndays 21)))
;;    ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
;;      (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: ")))
;;    ("u" alltodo "" ((org-agenda-skip-function (lambda nil
;;      (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "]+>")))
;;      (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
;;  '(org-remember-templates (quote (
;;     ("todo" 116 "* TODO %? %u" "~/todo.org" "Tasks" nil)
;;     ("notes" 110 "* %u %?" "~/notes.org" "Notes" nil)
;;     ("past" 110 "* %u %?" "~/past.org" "Notes" nil)
;;     ("wcmt" 119 "* TODO %? :wcmt:" "~/wcmt-td.org" "WCMT ongoing" nil))))
;; (setq org-completion-use-iswitchb t)
;; (setq org-completion-use-ido nil)
;; (add-hook 'org-mode-hook '(lambda () (auto-fill-mode -1)))
;; (add-hook 'org-mode-hook '(lambda () (visual-line-mode 1)))


;; -----------------
;; =================
;; **  Web        **
;; =================
;; -----------------

;; Restructured Text
;; http://docutils.sourceforge.net/docs/user/emacs.html
(require 'rst)

;; ;; ;; Emacs IRC
;; (require 'erc)



;;---
;; CUSTOM set variables
;; custom-set-variables was added by Custom. blah blah blah.
;;
(custom-set-variables
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
 '(yas/good-grace t)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(setq skeleton-pair nil)
