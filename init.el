;; owner: Elena Williams
;; new version initialised: 5-Jul-2018
;; last updated: 14-Jul-2018

;; --
;; Installation
;; See README and files at: https://github.com/elena/.emacs

;; (setq package-list '(

;;     ;; convenience
;;     autopair
;;     buffer-move
;;     god-mode
;;     magit
;;     neotree
;;     vimish-fold
;;     whitespace-cleanup-mode

;;     ;; application
;;     cypher-mode
;;     django-manage
;;     django-mode
;;     django-snippets
;;     djangonaut
;;     elpy
;;     indium
;;     markdown-preview-mode
;;     py-autopep8
;; ))

(package-initialize)
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; --
;; Guidelines for using this file (to prevent confusion and delay):

;; # BE TIDY
;;   Remove broken cruft where possible.
;;   If it doesn't work or isn't being used it shouldn't be here.

;; # FILE CORRECTLY UNDER HEADINGS:
;;   Keep all similar configuration together under appropriate headings.

;; # ALPHABETISE where possible.
;;   Put packages under headings alphabetically to mitigate duplication.

;; # KEEP ALL PACKAGE CONFIG TOGETHER
;;   Always start with `require`
;;   EXCEPT "global-set-key", these all go together

;; # CUSTOM KEYS DICTIONARY group together
;;   All custom uses of "global-set-key" as grouped near the top of this file
;;   - So I know what they are and use them
;;   - Prevent duplication
;;   - Endeavour for consistent/sane chord conventions

;; --
;; Contents:
;;
;; +++++++++++++++++++++
;; 1. BASICS
;;       Emacs most basic customisations such as themes, locations, keys
;; +++++++++++++++++++++
;; 2. EMACS-modules
;;       Emacs 3rd-party features I like such as org-mode
;; +++++++++++++++++++++
;; 3. USES
;;       My use cases such as python, html


;; To install a new package:
;; https://www.emacswiki.org/emacs/InstallingPackages

;; http://ergoemacs.org/emacs/emacs_package_system.html

;; 1. uncomment the following as required:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

;; 2. `M-x list-package`
;; 3. select package to install
;; 4. add (require 'newly-install-package) in appropriate section of this file


;; ++++++++++++++++++++++++++++++++++++++++++
;; BASICS
;;
;; Exception, at top:
;; - [*] Key-binding preferences
;;
;; - [*] theme/visuals
;; - [*] configurations for modes
;; - [*] backup
;; - [*] recentf
;; ++++++++++++++++++++++++++++++++++++++++++

;; -----------------------
;; key-bindings

;; key-bindings: built-ins
(global-set-key (kbd "C-c #") 'comment-region)
(global-set-key (kbd "C-x #") 'uncomment-region)
(global-set-key (kbd "C-x ^")  'delete-indentation)
(global-set-key (kbd "C-c C-a") 'auto-complete-mode)
(global-set-key (kbd "C-c C-e") 'load-file)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "C-M-r") 'remember)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)


;; key-bindings: my custom functions
(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)
(global-set-key (kbd "C-c d") 'duplicate-line)
(global-set-key (kbd "C-c C-d") 'insert-current-date-time)
(global-set-key (kbd "C-c C-t") 'insert-current-time)

;; key-bindings: installed extensions
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)
(global-set-key (kbd "<f8>") 'neotree)
(global-set-key (kbd "<f9>") 'god-mode-all)
(global-set-key (kbd "C-c o") 'org-iswitchb)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c C-v f") 'vimish-fold)
(global-set-key (kbd "C-c C-v v") 'vimish-unfold)
(global-set-key (kbd "C-c C-v a") 'vimish-refold-all)
(global-set-key (kbd "C-c C-v t") 'vimish-toggle)
(global-set-key (kbd "C-c C-v d") 'vimish-fold-delete)


;; -----------------------
;; theme/visuals settings
(load "~/.emacs.d/charcoal-theme")
(global-linum-mode t) ;; enable line numbers globally
(global-hl-line-mode t) ;; enable highlight current line

;; linux specific
(set-default-font "Monospace-9.5")
(add-to-list 'default-frame-alist '(height . 1440))
(add-to-list 'default-frame-alist '(width . 180))

;; OSX specific
;; (set-keyboard-coding-system nil)
;; (setq mac-command-modifier 'meta)
;; (set-default-font "Menlo-10")

;; window specific
;; set default size to maximum window
;; (defun w32-maximize-frame ()
;;   "Maximize the current frame"
;;   (interactive)
;;   (w32-send-sys-command 61488))
;; (set-default-font "ProggyCleanTT CE-11:bold")


;; -----------------------
;; configure modes
(column-number-mode 1)
(delete-selection-mode 1)
(line-number-mode 1)
(size-indication-mode 1)
(tool-bar-mode -1)
(whitespace-cleanup-mode 1)
(windmove-default-keybindings)


;; configure variables
(setq calendar-latitude -35.17)
(setq calendar-location-name "Sydney")
(setq calendar-longitude 149.08)
(setq column-number-mode t)
(setq display-battery-mode t)
(setq display-time-mode t)
(setq find-file-wildcards t)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq indicate-empty-lines t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t) ;; hide the startup message
(setq iswitchb-buffer-ignore '("^\*"))
(setq minibuffer-default-add-shell-commands t)
(setq ring-bell-function 0)
(setq save-place-mode t)
(setq show-paren-mode t)
(setq size-indication-mode t)
(setq tool-bar-mode nil)
(setq require-final-newline t)
(setq visible-bell 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; -----------------------
;; backup: put `*.*~` files in `~/.saves` rather than throughout my fs
(setq backup-by-copying 1
      backup-directory-alist '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 9
      kept-old-versions 2)

;; -----------------------
;; (global-set-key (kbd "<f8>") 'neotree)
(require 'neotree)
(setq neo-default-system-application "open")

;; -----------------------
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 99)
(recentf-mode +1)

;; -----------------------
;; autopair
(autopair-global-mode)
(show-paren-mode 1)

;; -----------------------
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; -----------------------
(require 'vimish-fold)
(vimish-fold-global-mode 1)

;; -----------------------
(require 'buffer-move)
;; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
;; (global-set-key (kbd "<C-S-right>")  'buf-move-right)


;; ++++++++++++++++++++++++++++++++++++++++++
;; EMACS modules
;;
;; - [*] custom: beginning-of-line-or-indentation
;; - [*] custom: date-time
;; - [*] custom: duplicate-line
;; - [*] custom: switch-to-minibuffer
;; - [*] god-mode
;; - [ ] org-mode
;; - [ ] remember
;; ++++++++++++++++++++++++++++++++++++++++++


;; ----------------------
;; (global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)
(defun beginning-of-line-or-indentation ()
  "Move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

;; -----------------------
;; (global-set-key (kbd "C-c C-d") 'insert-current-date-time)
;; (global-set-key (kbd "C-c C-t") 'insert-current-time)
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
       (insert "\n"))

(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       (insert "\n"))

;; -----------------------
;; (global-set-key (kbd "C-c d") 'duplicate-line)
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


;; -----------------------
;; (global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))


;; -----------------------
;; see: https://github.com/chrisdone/god-mode/
;; Save RSI by while in god-mode to assume \C- prefix
(require 'god-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)




;; ++++++++++++++++++++++++++++++++++++++++++
;; USES
;;
;; *programming: c, Git, Java, Javascript, Python
;; *web front end: CSS, HTML
;; *text: Markdown, Text, ReStructured Text, LaTex
;; *data: Neo4j/cypher, SQL
;; [12]
;;
;; - [ ] C
;; - [ ] CSS
;; - [ ] Django
;; - [ ] Git
;; - [*] HTML # web-mode
;; - [ ] Java
;; - [ ] Javascript
;; - [*] Markdown
;; - [*] Neo4j/cypher
;; - [*] Python
;; - [ ] SQL
;; - [ ] Text
;; - [*] reStructured Text
;; [12]
;; ++++++++++++++++++++++++++++++++++++++++++

;; -----------------------
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)


;; -----------------------
(elpy-enable)
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; -----------------------
(require 'rst)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("62408b3adcd05f887b6357e5bd9221652984a389e9b015f87bbc596aba62ba48" default)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(package-selected-packages
   (quote
    (magit-gitflow web-mode powerline buffer-move whitespace-cleanup-mode vimish-fold py-autopep8 neotree markdown-preview-mode magit indium god-mode elpy djangonaut django-snippets django-mode django-manage cypher-mode autopair)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
