;; Elena's emacs init

;; emacs usage:
;;
;; ~ python
;;   - django
;;   - scripts
;;
;; ~ web front-end
;;   - html/css/javascript
;;   - php
;;
;; ~ text editing (crazy!)
;;   - rst
;;   - markdown
;;
;; ~ org-mode
;;
;; install the following:
;;
;;  git@github.com:magit/magit.git
;;  git@github.com:magit/git-modes.git
;;  https://github.com/defunkt/markdown-mode


;; ALL THE 'REQUIRES' up the top
;; In load order.
(add-to-list 'load-path "~/.emacs.d/")
(require 'recentf)
(require 'auto-complete-config)
(require 'color-theme)

(setq package-enable-at-startup nil)

(defun set-frame-width-interactive (arg)
   (interactive "p")
   (set-frame-width (selected-frame) arg))


;; ---------------
;; ===============
;; ** UTILITIES **
;; ===============
;; ---------------
;; The day-to-day stuff can't live without and works universally.
;; Not specific to an application
(setq inhibit-splash-screen t)
(delete-selection-mode 1)
(line-number-mode 1)
(tool-bar-mode -1)
(setq calendar-latitude -35.17)
(setq calendar-location-name "Sydney")
(setq calendar-longitude 149.08)
(setq find-file-wildcards t)
(setq minibuffer-default-add-shell-commands t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;(find-file "~/.emacs.d/init.el")

;; Options have liked the look of at whatever stage.
;; (desktop-save-mode 1)
;; (split-window-horizontally)
;; (windmove-default-keybindings) ;; use shift-arrowkeys
;; (require 'framemove)
;; (framemove-default-keybindings) ;; default prefix is Meta
;; (setq pop-up-frames t)
;; (setq iswitchb-buffer-ignore '("^\\*"))

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
(setq recentf-max-saved-items 99)


;; -----------------
;; =================
;; ** CONVENIENCE **
;; =================
;; -----------------
;; Niceties not specific to an application.

;; ------------------
;; * Linux specific *
;; ------------------

;; (set-default-font "-unknown-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-frame-font "-unknown-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-default-font "-unknown-ProggyCleanTT-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-frame-font "-unknown-ProggyCleanTT-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-default-font "-monotype-Andale Mono-normal-normal-normal--8-*-75-75-m-0-iso10646-1")
;; (set-frame-font "-monotype-Andale Mono-normal-normal-normal--8-*-75-75-m-0-iso10646-1")
;; (set-default-font "Monaco 8")
;; (set-frame-font "Monaco 8")
;; (set-face-attribute 'default nil :height 80)
;; (set-face-attribute 'default nil :font "Ubuntu Mono")
;; (set-default-font "Monaco 7")
;; (set-default-font "Ubuntu Mono 8")
;; (set-default-font "DejaVu Sans Mono 8")
;; (set-default-font "Andale Mono 8")
;; (set-default-font "ProggyCleanTT 10")

(set-default-font "DejaVu Sans Mono-9")
(set-face-attribute 'default nil :height 75)

;; (set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-default-font "Mono-8")
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
;; below the fold
(global-set-key "\C-c\ o" 'org-iswitchb)
(global-set-key "\C-c\ a" 'org-agenda)
(global-set-key "\C-c\ l" 'org-store-link)
(global-set-key "\C-\M-r" 'remember)
(global-set-key "\C-x\ g" 'magit-status)

(global-set-key "\C-x\ n" 'flymake-goto-next-error)


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

;; Kill unused minibuffer
;; ----------------------
;; Automatically killing the the minibuffer if mouse is clicked outside minibuffer.
;; This often happens after C-x f when trying to find location of file trying to find.

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

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

;; Duplicate/Uniquify Line
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

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

;; ====================
;; insert date and time

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

(global-set-key "\C-c\C-d" 'insert-current-date-time)
(global-set-key "\C-c\C-t" 'insert-current-time)

;; -------------
;; ** Display **
;; -------------
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-charcoal-black)
;; (color-theme-shaman)
;; (require 'theme-changer)
;; (change-theme 'color-theme-gtk-ide 'color-theme-charcoal-black)
;; ;; Icicles
;; ;; Pretty, nice, but greedy.
;; ;;(require 'icicles)
;; ;;(icy-mode 1)
;; ;; (require 'doremi-cmd)



;; the fold ---------------------------------------------------------------------
;; ==============================================================================
;; application specific configuration -------------------------------------------
;; 25-Mar-2013:
;; Tidying still required.
;;

;; -----------------
;; =================
;; **  Python     **
;; =================
;; -----------------
;; https://github.com/gabrielelanaro/emacs-for-python

;; * emacs-for-python *
;; --------------------
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/")
(require 'epy-setup)
(require 'epy-python)
(require 'epy-editing)
(require 'epy-bindings)

;; * completions *
;; ---------------
(require 'epy-completion)
(setq skeleton-pair nil) ;; this setting (in this location) drove me nuts to find

;; * nose tests *
;; --------------
;; "nose extends unittest to make testing easier"
(require 'epy-nose)

;; * pyflakes *
;; ------------
(epy-setup-checker "/usr/local/bin/pyflakes %f")

;; * ipython *
;; ------------
(epy-setup-ipython)

;; * misc *
;; ------------

;; (global-hl-line-mode t)
;; (set-face-background 'hl-line "black")

;; (require 'highlight-indentation)
;; (add-hook 'python-mode-hook 'highlight-indentation)

;; ------------
;; * additional python *
;; ------------

(defun pymacs-restart ()
  (interactive)
  (pymacs-load "ropemacs" "rope-"))


;; -----------------
;; =================
;; **  todo.txt   **
;; =================
;; -----------------

;;(find-file "~/Dropbox/todo/todo.txt")

;(require 'todotxt)
;; (require 'todotxt-mode)
;(add-to-list 'auto-mode-alist '("\\todo.txt\\'" . todotxt))
;; (add-to-list 'auto-mode-alist '("\\todo.txt\\'" . todotxt-mode))

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

;; (epy-django-snippets)

;; * rainbow-mode *
;; ----------------
(add-hook 'less-css-mode-hook '(lambda () (rainbow-mode 1)))
(add-hook 'css-mode-hook '(lambda () (rainbow-mode 1)))

;; (require 'web-vcs)
;; (add-to-list 'load-path "~/.emacs.d/nxhtml")
;; (add-to-list 'load-path "~/.emacs.d/nxhtml/nxhtml")
;; (require 'nxhtml)

(add-hook 'html-mode-hook' '(lambda () (setq indent-tabs-mode nil)))


;; * web-mode *
;; ----------------

(require 'web-mode)
(defun add-auto-mode (mode &rest patterns)
  (mapc (lambda (pattern)
          (add-to-list 'auto-mode-alist (cons pattern mode)))
        patterns))

(add-auto-mode 'web-mode
               "*html*" "*twig*" "*tmpl*" "\\.erb" "\\.rhtml$" "\\.ejs$" "\\.hbs$"
               "\\.ctp$" "\\.tpl$" "/\\(views\\|html\\|templates\\)/.*\\.php$")


;; (require 'html-helper-mode)
;; (autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)

;; ;; (defun django-html-mode-hook ()
;; ;;   "Switch to `django-mode' if Django template was opened."
;; ;;   (save-excursion
;; ;;     (if (or (search-forward "{%")
;; ;;             (search-forward "{{"))
;; ;; 	(django-mode))))
;; ;;         ;;(django-html-mumamo-mode))))

;; ;; (add-hook 'nxhtml-mumamo-mode-hook 'django-html-mode-hook)

;; ;; css
;; (require 'css-mode)
;; (require 'css-check)

;; (autoload 'css-mode "css-mode")

;; (add-hook 'html-helper-load-hook
;;   (function (lambda () (load "css.el"))))

;; ;; javascript
;; ;; js2 is too heavy handed! No minor mode!
;; ;; (autoload 'js2-mode "js2" nil t)
;; ;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; (require 'javascript-mode)

;; ;; django everything
;; ;; Old!
;; (require 'pony-mode)
;; (require 'django-mode)
;; (require 'django-html-mode)

;; ;; new: https://code.djangoproject.com/wiki/autoload
;; (autoload 'django-html-mumamo-mode "~/.emacs.d/nxhtml/autostart.el")
;; (setq auto-mode-alist
;;       (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
;; (setq mumamo-background-colors nil)
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; ;; Restructured Text
;; ;; http://docutils.sourceforge.net/docs/user/emacs.html
;; ;;(require 'rst)

;; ;; Emacs IRC
;; (require 'erc)

;; ;;---
;; ;; MODE ASSOCIATIONS
;; (setq auto-mode-alist
;;       (append '(
;; 		("\\.htm$" . html-mode)
;;                 ("\\.html$" . html-mode)
;;                 ("\\.html$" . html-helper-mode)
;; 		("\\.mako$" . html-mode)
;; 		("\\.css$" . css-mode)
;; 		;;("\\.txt$" . rst-mode)
;;                 ;;("\\.rst$" . rst-mode)
;;                 ;;("\\.rest$" . rst-mode)
;; 		) auto-mode-alist))
;; ;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;; (require 'php-mode)
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-hook 'web-mode-hook (lambda () (global-font-lock-mode -1)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Package management ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;
;; (defvar custom-packages
;;   '(
;;     yasnippet
;;     rainbow-mode
;;     ))

;; (autoload 'django-html-mumamo-mode "~/.emacs.d/nxhtml/autostart.el")
;; (setq auto-mode-alist
;;       (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
;; (setq mumamo-background-colors nil)
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
;; (add-hook 'html-mode-hook
;;           '(lambda ()
;;              (auto-fill-mode -1)))

;; ;; ;;;;;;;;;;;;;;;
;; ;; ;; text mode ;;
;; ;; ;;;;;;;;;;;;;;;
;; (add-hook 'text-mode-hook
;;           '(lambda ()
;;              (auto-fill-mode -1)))
;; (remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; ;; ;;;;;;;;;;;;;;
;; ;; ;; markdown ;;
;; ;; ;;;;;;;;;;;;;;

(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt" . markdown-mode))


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
 ;; '(display-battery-mode t)
 '(display-time-mode t)
 '(ibuffer-saved-filter-groups nil)
 '(ibuffer-saved-filters (quote (("" ((filename . "") (content . "") (filename . "") (name . ""))) ("gnus" ((or (mode . message-mode) (mode . mail-mode) (mode . gnus-group-mode) (mode . gnus-summary-mode) (mode . gnus-article-mode)))) ("programming" ((or (mode . emacs-lisp-mode) (mode . cperl-mode) (mode . c-mode) (mode . java-mode) (mode . idl-mode) (mode . lisp-mode)))))))
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(jabber-account-list (quote (("ele.wil@gmail.com" (:password . "") (:network-server . "talk.google.com") (:port . 80) (:connection-type . ssl)))))
 '(save-place t nil (saveplace))
 '(send-mail-function (quote sendmail-send-it))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
;;  '(yas/good-grace t)
;;  '(yas/prompt-functions (quote (yas/ido-prompt yas/completing-prompt yas/no-prompt)))
;;  '(yas/prompt-functions (quote (yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt)))
;;  '(yas/snippet-dirs (quote ("~/.emacs.d/yasnippet/snippets")) nil (yasnippet))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "Grey15" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "monotype" :family "Andale Mono")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
