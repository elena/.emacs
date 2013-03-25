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
;;   - rst/markdown
;;




;; ALL THE 'REQUIRES' up the top

(require 'recentf)
;; (require 'auto-complete)


;; -----------------
;; Linux specific
;; -----------------

;; FONT
;; (set-default-font "DejaVu Sans Mono-9")
;; (set-default-font "Monaco Regular-10")
;; (set-default-font "Nimbus Mono")
;; (set-default-font "ProggyClean-11:bold")
;; (set-default-font "Monaco Regular-10")

;; -----------------
;; OSX specific
;; -----------------
(set-keyboard-coding-system nil)
(setq mac-command-modifier 'meta)

;; FONT
(set-default-font "Menlo-10")

;; -----------------
;; Windows specific
;; -----------------
;; set default size to maximum window
;; (defun w32-maximize-frame ()
;;   "Maximize the current frame"
;;   (interactive)
;;   (w32-send-sys-command 61488))

;; FONT
;; (set-default-font "ProggyCleanTT CE-11:bold")
;; (set-default-font "DejaVu Sans Mono-9")



;; ---------------
;; ===============
;; ** UTILITIES **
;; ===============
;; ---------------
;; The day-to-day stuff can't live without and works universally.
;; Not specific to an application


(line-number-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; use shift-arrowkeys
;; (windmove-default-keybindings)

;; (require 'framemove)
;; (framemove-default-keybindings) ;; default prefix is Meta
;; (setq pop-up-frames t)

;; (setq iswitchb-buffer-ignore '("^\\*"))


(find-file "~/.emacs.d/init.el")
;; (find-file "~/Dropbox/td/todo.htm")


;; -----------------
;; Backup management
;; -----------------

(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist '(("." . "~/.saves"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2)

(tool-bar-mode -1)
(setq inhibit-splash-screen t)
(delete-selection-mode 1)
(setq find-file-wildcards t)
;;(desktop-save-mode 1)
;;(split-window-horizontally)

;; ------
;; Recent
;; ------
(recentf-mode 1)
(setq recentf-max-menu-items 99)

;; ------------
;; Key-Bindings
;; ------------
;; Additional bindings that make me happy.

;; (global-set-key "\C-z" 'undo)
;; ;; (global-set-key "\C-tab") 'other-window)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key "\C-c\ o" 'org-iswitchb)
(global-set-key "\C-c\ a" 'org-agenda)
(global-set-key "\C-c\ l" 'org-store-link)
(global-set-key "\C-\M-r" 'remember)

(global-set-key "\C-c\ \C-e" 'load-file)
(global-set-key "\C-c\ #" 'comment-region)
(global-set-key "\C-x\ #" 'uncomment-region)
(global-set-key "\C-c\ \C-a" 'auto-complete-mode)
(global-set-key "\C-x\ g" 'magit-status)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-x ^")  'delete-indentation)


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

;; Auto-Complete
;; -------------

(defun auto-complete-mode-maybe ()
 (unless (minibufferp (current-buffer))
   (auto-complete-mode 1)))

(global-auto-complete-mode t)

;; to ensure activated:
(add-to-list 'auto-complete-mode 'sql-mode)
(add-to-list 'auto-complete-mode 'python-mode)
(add-to-list 'auto-complete-mode 'django-mode)
(add-to-list 'auto-complete-mode 'pony-mode)
(add-to-list 'auto-complete-mode 'pony-minor-mode)
(add-to-list 'auto-complete-mode 'html-mode)
(add-to-list 'auto-complete-mode 'html-helper-mode)
(add-to-list 'auto-complete-mode 'css-mode)
(add-to-list 'auto-complete-mode 'rst-mode)
(add-to-list 'auto-complete-mode 'conf-mode)
(add-to-list 'auto-complete-mode 'emacs-lisp-mode)

;; Interactively Do Things (ido)
;; -----------------------------
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


;; Icicles
;; Pretty, nice, but greedy.

;;(require 'icicles)
;;(icy-mode 1)
;; (require 'doremi-cmd)


































(load-file "~/.emacs.d/emacs-for-python/epy-init.el")


;;;;;;;;;;;;;;;;;;;;;;;;
;; Package management ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(defvar custom-packages
  '(
    yasnippet
    rainbow-mode
    ))

(autoload 'django-html-mumamo-mode "~/.emacs.d/nxhtml/autostart.el")
(setq auto-mode-alist
      (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))


(add-hook 'html-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

;; ;;;;;;;;;;;;;;;
;; ;; text mode ;;
;; ;;;;;;;;;;;;;;;

(add-hook 'text-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;;;;;;;;;;;;
;; python ;;
;;;;;;;;;;;;


;;;;;;;;;;;;;;
;; org mode ;;
;;;;;;;;;;;;;;

(add-hook 'org-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

(add-hook 'org-mode-hook
          '(lambda ()
             (visual-line-mode 1)))

;; ;;;;;;;;;;;;;;
;; ;; markdown ;;
;; ;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown" . markdown-mode))



;;;;;;;;;;;;;;;;;;
;; rainbow-mode ;;
;;;;;;;;;;;;;;;;;;

(add-hook 'less-css-mode-hook
          '(lambda ()
             (rainbow-mode 1)))

(add-hook 'css-mode-hook
          '(lambda ()
             (rainbow-mode 1)))

;;;;;;;;;;;;;;
;; pyflakes ;;
;;;;;;;;;;;;;;
;; Requires python package "pyflakes" to be installed

(epy-setup-checker "~/site-packages/pyflakes/bin/pyflakes %f")


;; ---
;; ADDED packages and modules
;;

(add-to-list 'load-path "~/.emacs.d/")


;; python
(autoload 'python-mode "python-mode.el"
  "Major mode for editing Python source." t)

;; load ipython.el if ipython is available
;; (when (executable-find "ipython")
;;    (require 'ipython nil 'noerror))
;; (when (featurep 'ipython)
;;   (setq python-python-command "ipython")
;;   (autoload 'py-shell "ipython"
;;     "Use IPython as the Python interpreter." t))


;; web front-end:
;; html, css, js

(require 'web-vcs)
(add-to-list 'load-path "~/.emacs.d/nxhtml")
(add-to-list 'load-path "~/.emacs.d/nxhtml/nxhtml")
(require 'nxhtml)

(require 'html-helper-mode)
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)

;; (defun django-html-mode-hook ()
;;   "Switch to `django-mode' if Django template was opened."
;;   (save-excursion
;;     (if (or (search-forward "{%")
;;             (search-forward "{{"))
;; 	(django-mode))))
;;         ;;(django-html-mumamo-mode))))

;; (add-hook 'nxhtml-mumamo-mode-hook 'django-html-mode-hook)

;; css
(require 'css-mode)
(require 'css-check)

(autoload 'css-mode "css-mode")

(add-hook 'html-helper-load-hook
  (function (lambda () (load "css.el"))))

;; javascript
;; js2 is too heavy handed! No minor mode!
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'javascript-mode)


;; django everything
;; Old!
(require 'pony-mode)
(require 'django-mode)
(require 'django-html-mode)

;; new: https://code.djangoproject.com/wiki/autoload
(autoload 'django-html-mumamo-mode "~/.emacs.d/nxhtml/autostart.el")
(setq auto-mode-alist
      (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))


;; Restructured Text
;; http://docutils.sourceforge.net/docs/user/emacs.html
;;(require 'rst)

;; Emacs IRC
(require 'erc)

;;---
;; MODE ASSOCIATIONS
(setq auto-mode-alist
      (append '(
		("\\.htm$" . html-mode)
                ("\\.html$" . html-mode)
                ("\\.html$" . html-helper-mode)
		("\\.mako$" . html-mode)
		("\\.css$" . css-mode)
		;;("\\.txt$" . rst-mode)
                ;;("\\.rst$" . rst-mode)
                ;;("\\.rest$" . rst-mode)
		) auto-mode-alist))

;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

(require 'php-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook (lambda () (global-font-lock-mode -1)))

;; -------
;; DISPLAY
;; (last before custom-set to make debugging this file easier)
;; -------

;; colour theme
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-charcoal-black)
;;(color-theme-shaman)

(setq calendar-latitude -35.17)
(setq calendar-longitude 149.08)
(setq calendar-location-name "Sydney")

(require 'theme-changer)
;;(change-theme 'color-theme-gtk-ide 'color-theme-charcoal-black)


;; --------
;; ORG-mode
;; --------

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done 'time)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(indicate-empty-lines t)
 '(org-agenda-custom-commands (quote (("d" todo "DELEGATED" nil) ("c" todo "DONE|DEFERRED|CANCELLED" nil) ("w" todo "WAITING" nil) ("W" agenda "" ((org-agenda-ndays 21))) ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "
]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-agenda-files (quote ("~/Google Drive/td.htm")))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/notes.org")
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-remember-store-without-prompt t)
 '(org-remember-templates (quote (
                                  ("todo" 116 "* TODO %? %u" "~/todo.org" "Tasks" nil)
                                  ("notes" 110 "* %u %?" "~/notes.org" "Notes" nil)
                                  ("past" 110 "* %u %?" "~/past.org" "Notes" nil)
                                  ("wcmt" 119 "* TODO %? :wcmt:" "~/wcmt-td.org" "WCMT ongoing" nil))))
 '(org-reverse-note-order t)
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler)))
 '(save-place t nil (saveplace))
 '(send-mail-function (quote sendmail-send-it))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

;; (setq org-completion-use-iswitchb t)
;; (setq org-completion-use-ido nil)




;;---
;; CUSTOM set variables
;; custom-set-variables was added by Custom. blah blah blah.
;;


 '(yas/good-grace t)
 '(yas/prompt-functions (quote (yas/ido-prompt yas/completing-prompt yas/no-prompt)))
 '(yas/prompt-functions (quote (yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt)))
 '(yas/snippet-dirs (quote ("~/.emacs.d/yasnippet/snippets")) nil (yasnippet))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)