;; The Good. It will give you:
;; 1. Syntax highlighting in .py files
;; 2. Syntax highlighting in .html files (with django template awareness)
;; 3. Syntax highlighting in css and less files
;; 3a. Coloured hex codes to the colour that they describe
;; 4. Smart tabbed autocompletion for many things
;; 5. Python error checking, checking things like variables referenced before assignment
;; 6. A nice colour scheme (tomorrow-eighties, but also downloads solarized)
;; 7. Various integrations with virtualenv and ipython

;; The Annoying. You need to download a few bits and bobs.
;; 0. Emacs 24.
;;    On osx:
;;      "brew install emacs --cocoa"
;;    On ubuntu:
;;      "sudo apt-add-repository ppa:cassou/emacs"
;;      "sudo apt-get update"
;;      "sudo apt-get install emacs-snapshot"
;;
;; 1. git
;;    On osx:
;;      "brew install git"
;;    On Ubuntu:
;;      "sudo apt-get install git"
;;
;; 2. bzr
;;    On osx:
;;      "brew install bzr"
;;    On Ubuntu:
;;      "sudo apt-get install bzr"
;;
;; 3. Emacs-for-python
;;    "git clone https://github.com/gabrielelanaro/emacs-for-python.git ~/.emacs.d/emacs-for-python/"
;;
;; 4. NxHtml
;;   "bzr branch lp:nxhtml ~/.emacs.d/nxhtml/
;;
;; 5. Aspell
;;    On osx:
;;      "brew install aspell --lang=en"
;;    On Ubuntu:
;;      "sudo apt-get install aspell aspell-en"
;;
;; 6a. pip
;;    "curl -O http://python-distribute.org/distribute_setup.py"
;;    "sudo python distribute_setup.py"
;;    "sudo easy_install pip"
;;
;; 6b. pyflakes
;;    "sudo pip install pyflakes"
;;
;; Finally, put this file in your home directory so Emacs can find it,
;; then start Emacs. It should download all the relevent Emacs
;; packages, and find all the packages already downloaded.

;; Big thanks to Gabriel Elanaro for emacs-for-python, which does a lot the work here.

;; (require 'git)

(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(load-file "~/.emacs.d/emacs-for-python/epy-init.el")

;;;;;;;;;;;;;;;;;;;;;;;;
;; Package management ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(defvar custom-packages
  '(starter-kit
    starter-kit-lisp
    starter-kit-eshell
    color-theme-sanityinc-solarized
    color-theme-sanityinc-tomorrow
    yaml-mode
    yasnippet
    yasnippet-bundle
    less-css-mode
    autopair
    js2-mode
    rainbow-mode
    deft
    handlebars-mode
    )
  )

(defun custom-packages-installed-p ()
  (loop for p in custom-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)
        )
  )

(unless (custom-packages-installed-p)
  (package-refresh-contents)
  (dolist (p custom-packages)
    (when (not (package-installed-p p))
      (package-install p)
      )))

;; ;; ;;;;;;;;;;;
;; ;; ;; Theme ;;
;; ;; ;;;;;;;;;;;

;; ;; (require 'color-theme-sanityinc-tomorrow)
;; ;; (load-theme 'sanityinc-tomorrow-eighties t)

;; ;; ;; alternately
;; ;; ;(require 'color-theme-sanityinc-solarized)
;; ;; ;(load-theme 'color-theme-sanityinc-solarized-dark)

;;;;;;;;;;;;
;; MuMaMo ;;
;;;;;;;;;;;;
;; This gives django template aware editing of html files
;; requires bzr download of most recent nxhtml
;; 1. install bzr
;; 2. run "bzr branch lp:nxhtml ~/.emacs.d/nxhtml"

(autoload 'django-html-mumamo-mode "~/.emacs.d/nxhtml/autostart.el")
(setq auto-mode-alist
      (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; ;;;;;;;;;;;;;;;
;; ;; html-mode ;;
;; ;;;;;;;;;;;;;;;

;; (add-hook 'html-mode-hook
;;           '(lambda ()
;;              (toggle-truncate-lines 1)))

(add-hook 'html-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

;;;;;;;;;;;;;;
;; autopair ;;
;;;;;;;;;;;;;;

;; (require 'autopair)

;; (add-hook 'django-html-mumamo-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'html-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'mumamo-border-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'django-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'django-variable-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'less-css-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'org-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;; (add-hook 'nxhtml-mode-hook
;;           '(lambda ()
;;              (autopair-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highlight indentation ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(require 'highlight-indentation)
;(add-hook 'python-mode-hook 'highlight-indentation)

;; ;;;;;;;;;;;;;;
;; ;; js2-mode ;;
;; ;;;;;;;;;;;;;;

;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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

;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;               (setq autopair-handle-action-fns
;;                     (list 'autopair-default-handle-action
;;                          'autopair-python-triple-quote-action))))

;; (add-hook 'python-mode-hook
;;           #'(lambda ()
;;               (toggle-truncate-lines 1)))

;; ;; ;;;;;;;;;;;;;;;
;; ;; ;; less mode ;;
;; ;; ;;;;;;;;;;;;;;;

;; ;; (add-hook 'less-css-mode-hook
;; ;;           '(lambda ()
;; ;;              (auto-fill-mode -1)))

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


;; ;; ;;;;;;;;;;
;; ;; ;; yaml ;;
;; ;; ;;;;;;;;;;

;; ;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;;;;;;;;;;;;;;;;;;
;; rainbow-mode ;;
;;;;;;;;;;;;;;;;;;

(add-hook 'less-css-mode-hook
          '(lambda ()
             (rainbow-mode 1)))

(add-hook 'css-mode-hook
          '(lambda ()
             (rainbow-mode 1)))

;; ;; ;;;;;;;;;;;;;;;;;;;
;; ;; ;; ispell/aspell ;;
;; ;; ;;;;;;;;;;;;;;;;;;;

;; ;; ;; helps emacs find homebrew installed aspell on osx
;; ;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; ;; (setq exec-path (append exec-path '("/usr/local/bin")))

;; ;; (setq ispell-program-name "aspell")
;; ;; (setq ispell-dictionary "british")
;; ;; (setq ispell-extra-args '("--sug-mode=ultra"))

;; ;; (defun fly-on-off-buffer-checked ()
;; ;;   "Flips buffer between having flyspell enabled and disabled whilst running flyspell
;; ;;    on the buffer. Spell check slows emacs down considerably."
;; ;;   (interactive)
;; ;;   (if (and (boundp 'flyspell-mode) flyspell-mode)
;; ;;       (flyspell-mode-off)
;; ;;     (progn (flyspell-mode 1) (flyspell-buffer)))
;; ;;   )

;; ;; (global-set-key (kbd "<f7>") 'fly-on-off-buffer-checked)
;; ;; (global-set-key (kbd "<f8>") 'ispell-word)

;; ;; (add-hook 'org-mode-hook
;; ;;           '(lambda ()
;; ;;              (flyspell-mode 0)))

;; ;; (add-hook 'html-mode-hook
;; ;;           '(lambda ()
;; ;;              (flyspell-mode 0)))

;; ;; (add-hook 'django-html-mumamo-mode-hook
;; ;;           '(lambda ()
;; ;;              (flyspell-mode 0)))

;; ;; (add-hook 'html-mode-hook
;; ;;           '(lambda ()
;; ;;              (flyspell-mode 0)))

;; ;; (add-hook 'mumamo-border-mode-hook
;; ;;           '(lambda ()
;; ;;              (flyspell-mode 0)))

;; ;; (add-hook 'django-mode-hook
;; ;;           '(lambda ()
;; ;;              (flyspell-mode 0)))

;; ;; (add-hook 'django-variable-mode-hook
;; ;;           '(lambda ()
;; ;;              (flyspell-mode 0)))


;;;;;;;;;;;;;;
;; pyflakes ;;
;;;;;;;;;;;;;;
;; Requires python package "pyflakes" to be installed

(epy-setup-checker "~/site-packages/pyflakes/bin/pyflakes %f")

;; hacky mc-hack-hack
;;(epy-setup-checker " %f")


;; ;;;;;;;;;;;;;;;;;;;;;;
;; ;; skeleton pairing ;;
;; ;;;;;;;;;;;;;;;;;;;;;;
;; ;; This functionality replaced by emacs package autopair

;; (setq skeleton-pair nil)

;; ;;;;;;;;;;
;; ;; deft ;;
;; ;;;;;;;;;;

;; (require 'deft)
;; (setq deft-text-mode 'markdown-mode)

;; ;;;;;;;;;;;;;;;;
;; ;; emacs-lisp ;;
;; ;;;;;;;;;;;;;;;;

;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda ()
;;              (auto-fill-mode -1)))

;; ;;;;;;;;;;;;;;;;;;;;;
;; ;; bits and pieces ;;
;; ;;;;;;;;;;;;;;;;;;;;;

(defun beginning-of-line-or-indentation ()
  "Move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)


;; (defun comment-dwim-line (&optional arg)
;;   "Replacement for the `comment-dwim' command.
;; If no region is selected and current line is not blank and we are not at the end of the line,
;; then comment current line.
;; Replaces default behaviour of `comment-dwim', when it inserts comment at the end of the line."
;;   (interactive "*P")
;;   (comment-normalize-vars)
;;   (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;       (comment-or-uncomment-region (line-beginning-position) (line-end-position))
;;     (comment-dwim arg)))
;; (global-set-key (kbd "M-;") 'comment-dwim-line)


;; (defun remove-dos-eol ()
;;   "Do not show ^M in files containing mixed UNIX and DOS line endings."
;;   (interactive)
;;   (setq buffer-display-table (make-display-table))
;;   (aset buffer-display-table ?\^M []))

;; (defun duplicate-line ()
;;   "Clone line at cursor, leaving the latter intact."
;;   (interactive "*")
;;   (save-excursion
;;     ;; The last line of the buffer cannot be killed
;;     ;; if it is empty. Instead, simply add a new line.
;;     (if (and (eobp) (bolp))
;;         (newline)
;;       ;; Otherwise kill the whole line, and yank it back.
;;       (let ((kill-read-only-ok t)
;;             deactivate-mark)
;;         (toggle-read-only 1)
;;         (kill-whole-line)
;;         (toggle-read-only 0)
;;         (yank)))))

;; (global-set-key (kbd "C-c d") 'duplicate-line)
;; (put 'dired-find-alternate-file 'disabled nil)
;; (setq ring-bell-function 'ignore)



;; ;; Org-mode configuration
;; ;; credit: http://newartisans.com/2007/08/using-org-mode-as-a-day-planner/

;; (require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; (define-key mode-specific-map [?a] 'org-agenda)

;; (eval-after-load "org"
;;   '(progn
;;      (define-prefix-command 'org-todo-state-map)

;;      (define-key org-mode-map "\C-cx" 'org-todo-state-map)

;;      (define-key org-todo-state-map "x"
;;        #'(lambda nil (interactive) (org-todo "CANCELLED")))
;;      (define-key org-todo-state-map "d"
;;        #'(lambda nil (interactive) (org-todo "DONE")))
;;      (define-key org-todo-state-map "f"
;;        #'(lambda nil (interactive) (org-todo "DEFERRED")))
;;      (define-key org-todo-state-map "l"
;;        #'(lambda nil (interactive) (org-todo "DELEGATED")))
;;      (define-key org-todo-state-map "s"
;;        #'(lambda nil (interactive) (org-todo "STARTED")))
;;      (define-key org-todo-state-map "w"
;;        #'(lambda nil (interactive) (org-todo "WAITING")))

;;      (define-key org-agenda-mode-map "\C-n" 'next-line)
;;      (define-key org-agenda-keymap "\C-n" 'next-line)
;;      (define-key org-agenda-mode-map "\C-p" 'previous-line)
;;      (define-key org-agenda-keymap "\C-p" 'previous-line)))

;; (require 'remember)
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (define-key global-map [(control meta ?r)] 'remember)

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



;; ---
;; APPEARANCE
;; (tool-bar-mode -1)

(find-file "~/.emacs.d/init.el")
(find-file "~/Dropbox/td/todo.htm")

(line-number-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; mac specific modifications
(set-keyboard-coding-system nil)
(setq mac-command-modifier 'meta)

;; use shift-arrowkeys
;; (windmove-default-keybindings)

;; (require 'framemove)
;; (framemove-default-keybindings) ;; default prefix is Meta

;;(setq pop-up-frames t)

;; set default size to maximum window
;; (defun w32-maximize-frame ()
;;   "Maximize the current frame"
;;   (interactive)
;;   (w32-send-sys-command 61488))

;; font
;; (set-default-font "ProggyCleanTT CE-11:bold")
;; (set-default-font "DejaVu Sans Mono-9")
;; (set-default-font "Monaco Regular-10")
;; (set-default-font "Nimbus Mono")
;; (set-default-font "ProggyClean-11:bold")
;;(set-default-font "Monaco Regular-10")
(set-default-font "Menlo-10")

;; Icicles
;; Pretty, nice, but greedy.

;;(require 'icicles)
;;(icy-mode 1)
;; (require 'doremi-cmd)

;; ---
;; AUTOLOAD

;; default view
(setq inhibit-splash-screen t)
;;(desktop-save-mode 1)
;;(split-window-horizontally)
(delete-selection-mode 1)

;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 99)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;(add-to-list 'load-path "~/.emacs.d/yasnippet")
;;(require 'yasnippet)
;;(yas/global-mode 1)

(setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

(setq yas/prompt-functions '(yas/ido-prompt
                             yas/completing-prompt))

;; (setq iswitchb-buffer-ignore '("^\\*"))

;; ;; ---
;; ;; BINDINGS
;; ;;

;; (global-set-key "\C-z" 'undo)
;; ;; (global-set-key "\C-tab") 'other-window)

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


;;---
;; DISPLAY
;; (last before custom-set to make debugging this file easier)

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

;; Backup management

(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist '(("." . "~/.saves"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2)


;; ---
;; AUTO-COMPLETION + SNIPPETS

(defun auto-complete-mode-maybe ()
 (unless (minibufferp (current-buffer))
   (auto-complete-mode 1)))

(require 'auto-complete)
(global-auto-complete-mode t)

(add-to-list 'auto-complete-mode 'sql-mode)
(add-to-list 'auto-complete-mode 'python-mode)
(add-to-list 'auto-complete-mode 'django-mode)
(add-to-list 'auto-complete-mode 'pony-mode)
(add-to-list 'auto-complete-mode 'pony-minor-mode)
(add-to-list 'auto-complete-mode 'html-mode)
(add-to-list 'auto-complete-mode 'html-helper-mode)
(add-to-list 'auto-complete-mode 'css-mode)
;;(add-to-list 'auto-complete-mode 'rst-mode)
(add-to-list 'auto-complete-mode 'conf-mode)
(add-to-list 'auto-complete-mode 'emacs-lisp-mode)


;;---
;; CUSTOM set variables
;; custom-set-variables was added by Custom. blah blah blah.
;;


 '(yas/good-grace t)
 '(yas/prompt-functions (quote (yas/ido-prompt yas/completing-prompt yas/no-prompt)))
 '(yas/prompt-functions (quote (yas/ido-prompt yas/dropdown-prompt yas/completing-prompt yas/x-prompt yas/no-prompt)))
 '(yas/snippet-dirs (quote ("~/.emacs.d/yasnippet/snippets")) nil (yasnippet))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
