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

;; (package-initialize)

;; (let ((default-directory "~/.emacs.d/"))
;;   (normal-top-level-add-subdirs-to-load-path))

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/"))
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa.org/packages/")))

;; (defvar my-packages
;;   '(better-defaults
;;     cyberpunk-theme
;;     elpy
;;     exec-path-from-shell
;;     flycheck
;;     magit
;;     markdown-mode
;;     markdown-preview-mode
;;     py-autopep8
;;     rainbow-delimiters
;;     smart-mode-line
;;     web-mode
;;     yaml-mode
;;     ))



;; (when (not package-archive-contents)
;;     (package-refresh-contents))
;; (package-initialize)

;; (dolist (p my-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))

;; (require 'better-defaults)
;; ;; (require 'modeline-posn)



;; ;; ALL THE 'REQUIRES' up the top
;; ;; In load order.
;; (add-to-list 'load-path "~/.emacs.d/")
;; (require 'recentf)
;; (require 'auto-complete-config)
;; (require 'color-theme)

;; (defun set-frame-width-interactive (arg)
;;    (interactive "p")
;;    (set-frame-width (selected-frame) arg))

;; (add-to-list 'load-path "~/.emacs.d/beancount/src/elisp")
;; (require 'beancount)
;; (add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))


;; (require 'god-mode)
;; (global-set-key (kbd "<f9>") 'god-mode-all)
;; (define-key god-local-mode-map (kbd ".") 'repeat)
;; (define-key god-local-mode-map (kbd "i") 'god-local-mode)

;; ;; (require 'golden-ratio)
;; ;; (golden-ratio-mode 1)
;; ;; (setq golden-ratio-auto-scale t)

;; ;; ---------------
;; ;; ===============
;; ;; ** UTILITIES **
;; ;; ===============
;; ;; ---------------
;; ;; The day-to-day stuff can't live without and works universally.
;; ;; Not specific to an application
;; (setq inhibit-splash-screen t)
;; (delete-selection-mode 1)
;; (line-number-mode 1)
;; (tool-bar-mode -1)
;; (column-number-mode 1)
;; (size-indication-mode 1)
;; (setq calendar-latitude -35.17)
;; (setq calendar-location-name "Sydney")
;; (setq calendar-longitude 149.08)
;; (setq find-file-wildcards t)
;; (setq minibuffer-default-add-shell-commands t)
;; (setq iswitchb-buffer-ignore '("^\*"))
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)


;; ;(find-file "~/Dropbox/td/todo.htm")
;; ;(find-file "~/.emacs.d/init.el")

;; ;; Options have liked the look of at whatever stage.
;; ;; (desktop-save-mode 1)
;; ;; (split-window-horizontally)
;; ;; (windmove-default-keybindings) ;; use shift-arrowkeys
;; ;; (require 'framemove)
;; ;; (framemove-default-keybindings) ;; default prefix is Meta
;; ;; (setq pop-up-frames t)
;; ;; (setq iswitchb-buffer-ignore '("^\\*"))

;; -----------------------
;; ** Backup management **
;; -----------------------
;; Put `*.*~` files in `~/.saves` rather than throughout my fs
(setq backup-by-copying t
  backup-directory-alist '(("." . "~/.saves"))
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2)

;; ------------
;; ** Recent **
;; ------------
(recentf-mode 1)
(setq recentf-max-menu-items 99)


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
;; (set-default-font "Ubuntu Mono-10")
;; (set-default-font "Liberation Mono-9")
;; (set-default-font "DejaVu Sans Mono-9")
;; (set-default-font "Monaco Regular-10")
;; (set-default-font "Nimbus Mono")
;; (set-default-font "ProggyClean-11:bold")
;; (set-default-font "Monaco Regular-9")

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
;; below the fold
(global-set-key "\C-c\ o" 'org-iswitchb)
(global-set-key "\C-c\ a" 'org-agenda)
(global-set-key "\C-c\ l" 'org-store-link)
(global-set-key "\C-\M-r" 'remember)
(global-set-key "\C-x\ g" 'magit-status)

;; -------------------
;; ** Auto-Complete **
;; -------------------
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
(defun auto-complete-mode-maybe ()
 (unless (minibufferp (current-buffer))
   (auto-complete-mode 1)))
(global-auto-complete-mode t)
;; ;; to ensure activated:
;; (add-to-list 'auto-complete-mode 'sql-mode)
;; (add-to-list 'auto-complete-mode 'python-mode)
;; (add-to-list 'auto-complete-mode 'django-mode)
;; (add-to-list 'auto-complete-mode 'pony-mode)
;; (add-to-list 'auto-complete-mode 'pony-minor-mode)
;; (add-to-list 'auto-complete-mode 'html-mode)
;; (add-to-list 'auto-complete-mode 'html-helper-mode)
;; (add-to-list 'auto-complete-mode 'css-mode)
;; (add-to-list 'auto-complete-mode 'rst-mode)
;; (add-to-list 'auto-complete-mode 'conf-mode)
;; (add-to-list 'auto-complete-mode 'emacs-lisp-mode)

;; -----------------------------------
;; ** Interactively Do Things (ido) **
;; -----------------------------------
(setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

;; Snippets
;; --------
(setq yas/prompt-functions '(yas/ido-prompt
                             yas/completing-prompt))
;;(add-to-list 'load-path "~/.emacs.d/yasnippet")
;;(require 'yasnippet)
;;(yas/global-mode 1)

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

;; -------------
;; ** Display **
;; -------------


;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-charcoal-black)
;; ;; Icicles
;; ;; Pretty, nice, but greedy.
;; ;;(require 'icicles)
;; ;;(icy-mode 1)
;; ;; (require 'doremi-cmd)




;; the fold ---------------------------------------------------------------------
;; ==============================================================================
;; application specific configuration -------------------------------------------

;; -----------------
;; =================
;; **  Python     **
;; =================
;; -----------------


;; -----------------
;; =================
;; **  todo.txt   **
;; =================
;; -----------------


;; -----------------
;; =================
;; **  Org        **
;; =================
;; -----------------
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done 'time)
(setq org-agenda-files (quote ("~/Google Drive/td.htm")))
(setq org-agenda-ndays 7)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-deadline-warning-days 14)
(setq org-default-notes-file "~/notes.org")
(setq org-fast-tag-selection-single-key (quote expert))
(setq org-remember-store-without-prompt t)
(setq org-reverse-note-order t)
(setq remember-annotation-functions (quote (org-remember-annotation)))
(setq remember-handler-functions (quote (org-remember-handler)))
 ;; syntax incorrect -- need to have in 'setq'
 ;; '(org-agenda-custom-commands (quote (
 ;;   ("d" todo "DELEGATED" nil)
 ;;   ("c" todo "DONE|DEFERRED|CANCELLED" nil)
 ;;   ("w" todo "WAITING" nil)
 ;;   ("W" agenda "" ((org-agenda-ndays 21)))
 ;;   ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
 ;;     (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: ")))
 ;;   ("u" alltodo "" ((org-agenda-skip-function (lambda nil
 ;;     (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "]+>")))
 ;;     (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 ;; '(org-remember-templates (quote (
 ;;    ("todo" 116 "* TODO %? %u" "~/todo.org" "Tasks" nil)
 ;;    ("notes" 110 "* %u %?" "~/notes.org" "Notes" nil)
 ;;    ("past" 110 "* %u %?" "~/past.org" "Notes" nil)
 ;;    ("wcmt" 119 "* TODO %? :wcmt:" "~/wcmt-td.org" "WCMT ongoing" nil))))
;; (setq org-completion-use-iswitchb t)
;; (setq org-completion-use-ido nil)
;; (add-hook 'org-mode-hook '(lambda () (auto-fill-mode -1)))
;; (add-hook 'org-mode-hook '(lambda () (visual-line-mode 1)))



;; -----------------
;; =================
;; **  Web        **
;; =================
;; -----------------

;; * rainbow-mode *
;; ----------------
(add-hook 'less-css-mode-hook '(lambda () (rainbow-mode 1)))
(add-hook 'css-mode-hook '(lambda () (rainbow-mode 1)))


;; Restructured Text
;; http://docutils.sourceforge.net/docs/user/emacs.html
(require 'rst)

;; ;; Emacs IRC
(require 'erc)


;;---
;; CUSTOM set variables
;; custom-set-variables was added by Custom. blah blah blah.
;;
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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
;;  '(yas/prompt-functions (quote (yas/ido-prompt yas/completing-prompt yas/no-prompt)))
;;  '(yas/prompt-functions (quote (yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt)))
;;  '(yas/snippet-dirs (quote ("~/.emacs.d/yasnippet/snippets")) nil (yasnippet))
;; (put 'downcase-region 'disabled nil)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
