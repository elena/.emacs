;; owner: Elena Williams
;; new version initialised: 5-Jul-2018
;; last updated: 19-Sep-2022

;; --
;; Installation
;; See README and files at: https://github.com/elena/.emacs


(setq package-list '(

    ;; convenience
    buffer-move
    flycheck
    ;; flymake
    magit
    move-text
    rainbow-delimiters
    rainbow-blocks
    rainbow-identifiers
    shackle
    symbol-overlay
    vimish-fold

    ;; application
    blacken
    cypher-mode
    elpy
    indium
    markdown-preview-mode
    pipenv
    py-isort
))

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
;;       Emacs 3rd-party features
;; +++++++++++++++++++++
;; 3. USES
;;       My use cases such as python, golang, frontend


;; To install a new package:

;; https://www.emacswiki.org/emacs/InstallingPackages

;; http://ergoemacs.org/emacs/emacs_package_system.html

;; 1. uncomment the following as required:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
;; (require 'use-package)

;; 2. `M-x list-package`
;; 3. select package to install
;; 4. add (require 'newly-install-package) in appropriate section of this file

;; (package-initialize)
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))


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
;; theme/visuals settings
(load "~/.emacs.d/charcoal-theme")
(display-line-numbers-mode t) ;; enable line numbers globally
(global-hl-line-mode t) ;; enable highlight current line

;; Rainbows

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-blocks-mode)
(add-hook 'prog-mode-hook #'rainbow-identifiers-mode)


;; linux specific

;; (set-default-font "Oxygen Mono-8.5")
;; https://fonts.google.com/specimen/Oxygen+Mono
;; cd /usr/share/fonts
;; sudo mkdir googlefonts
;; --> unzip, copy  OxygenMono-Regular.ttf to googlefonts
;; sudo chmod -R --reference /usr/share/fonts/opentype /usr/share/fonts/googlefonts
;; sudo fc-cache -fv
;; fc-match Oxygen

;; -- > update in theme, NOT HERE
;; (set-default-font "Liberation Mono-8.5")
;; (set-default-font "Bitstream Vera Sans Mono-8.5")
;; (set-default-font "DejaVu Sans Mono-8")
;; (set-default-font "Monospace-8.5")

(setq desktop-path '("."))
(winner-mode 1)

;; OSX specific
;; (set-keyboard-coding-system nil)
;; (setq mac-command-modifier 'meta)
;; (set-default-font "Menlo-10")

;; Windows specific
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
(setq minibuffer-default-add-shell-commands t)
(setq ring-bell-function 0)
(setq save-place-mode t)
(setq show-paren-mode t)
(setq size-indication-mode t)
(setq tool-bar-mode nil)
(setq require-final-newline t)
(setq visible-bell 1)


;; -----------------------
;; backup: put `*.*~` files in `~/.saves` rather than throughout my fs
(setq backup-by-copying 1
      backup-directory-alist '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 9
      kept-old-versions 2)

;; -----------------------
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 99)
(recentf-mode +1)

(add-to-list 'recentf-exclude (format "%s/\\.emacs\\.d/elpa/.*" (getenv "HOME")))

;; -----------------------
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; -----------------------


;; Navigation

;; -----------------------
(require 'move-text)
;; defined in keymaps:
;; (global-set-key [M-up] 'move-text-up)
;; (global-set-key [M-down] 'move-text-down)


;; -----------------------
(require 'buffer-move)
;; defined in keymaps:
;; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
;; (global-set-key (kbd "<C-S-right>")  'buf-move-right)


(windmove-default-keybindings)

;; ::::::::::::::::::::::::::::::::::::::::::

;; Experiments:

;; ;; -----------------------
;; ;; autopair
;; ;; (autopair-global-mode)
;; ;; (show-paren-mode 1)

;; ;; -----------------------
;; ;; (global-set-key (kbd "<f8>") 'neotree)
;; ;; (require 'neotree)
;; ;; (setq neo-default-system-application "open")

;; ;; -----------------------
;; ;; (require 'vimish-fold)
;; ;; (vimish-fold-global-mode 1)

;; (require 'workgroups)
;; (load "~/.emacs.d/layout-restore")
;; (require 'layout-restore)

;; ::::::::::::::::::::::::::::::::::::::::::

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
;; - [*] symbol-overlay
;; ++++++++++++++++++++++++++++++++++++++++++

;; ----------------------

(require 'comint)

(defun egit-pretty-log ()
  (interactive)
  (switch-to-buffer-other-window "shell-test")
  (end-of-buffer)
  (insert "git log --pretty=format:'%H|%cD|%s' -n 23")
  (comint-send-input) ;; get past RETURN required
  (comint-send-input)
  (switch-to-minibuffer-window)
)

(defun thea-goto-tests-to ()
  (interactive)
  (if
      (string-match "shell-test" (buffer-name))
      (switch-to-buffer-other-window work-buffer)
    (save-buffer)
    )
  (if
      (string-match "tests_to.sh" (buffer-name))
      (progn
        (switch-to-buffer-other-window work-buffer)
        )
    (progn
      (setq work-buffer (current-buffer))
      (switch-to-buffer-other-window "tests_to.sh")
      )
    )
    (switch-to-minibuffer-window)
  )

(defun thea-goto-tests ()
  (interactive)
  (if
      (string-match "shell-test" (buffer-name))
      (progn
        (insert "source tests_to.sh\n")
        (comint-send-input)
        )
    nil
    )
  (save-buffer)
  (setq work-buffer (current-buffer))
  (if
    (get-buffer "shell-test")
    (progn
      (switch-to-buffer-other-window "shell-test")
      (end-of-buffer)
      (insert "source tests_to.sh\n")
      (comint-send-input)
      )
    (progn
      (switch-to-buffer "*shell*")
      (shell)
      (rename-buffer "shell-test")
      ;; (insert "sudo docker start testneo4j")
      ;; (comint-send-input)
      ;; (insert "~/Working/Thea/development/neo4j-desktop-1.4.7-x86_64.AppImage &")
      ;; (comint-send-input)
      ;; (insert "cd  ~/Working/Thea/development/core && pipenv shell")
      (pyvenv-deactivate)
      (run-with-timer 5 nil 'pyvenv-deactivate)
      (run-with-timer 1 nil 'comint-send-input)
      (run-with-timer 2 nil 'insert "pipenv shell")
      (run-with-timer 2 nil 'comint-send-input)
      ;; (run-with-timer 2 nil 'insert "cd app")
      ;; (run-with-timer 2 nil 'comint-send-input)
      ;; (run-with-timer 2 nil 'insert "cd project")
      ;; (run-with-timer 2 nil 'comint-send-input)
      ;; (run-with-timer 3 nil 'insert "sudo docker start testneo4j")
      ;; (run-with-timer 3 nil 'comint-send-input)
      (run-with-timer 6 nil 'insert "source tests_to.sh\n")
      (run-with-timer 6 nil 'comint-send-input)
      )
    )
    (switch-to-minibuffer-window)
  )

(defun thea-goto-shell ()
  (interactive)
  (if
      (get-buffer "shell-manage")
      (switch-to-buffer-other-window "shell-manage")
    (progn
      (switch-to-buffer-other-window "*shell*")
      (shell)
      (rename-buffer "shell-manage")
      (insert "cd  ~/Working/Thea/development/core && pipenv shell"))
    )
)


;; ----------------------
(defun beginning-of-line-or-indentation ()
  "Move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))
;; defined in keymaps:
;; (global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)


;; -----------------------
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
;; defined in keymaps:
;; (global-set-key (kbd "C-c C-c C-d") 'insert-current-date-time)
;; (global-set-key (kbd "C-c C-c C-t") 'insert-current-time)


;; -----------------------
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
;; defined in keymaps:
;; (global-set-key (kbd "C-c M-d") 'duplicate-line)


;; -----------------------
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))
;; defined in keymaps:
;; (global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)


;; -----------------------


;; -----------------------
;; see: https://github.com/wolray/symbol-overlay
(require 'symbol-overlay)
(symbol-overlay-mode 1)

;; ++++++++++++++++++++++++++++++++++++++++++
;; USES
;;
;; *programming = tests_settings. c, Git, Java, Javascript, Python
;; *web front end: CSS, HTML
;; *text: Markdown, Text, ReStructured Text, LaTex
;; *data: Neo4j/cypher, SQL
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
;; ++++++++++++++++++++++++++++++++++++++++++

;; -----------------------


;; -----------------------
(elpy-enable)

(setq-default python-indent 4)

;; py-autopep8 Installation
;; python3 -m pip install black
;; python3 -m pip install isort



(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'blacken)
(add-hook 'python-mode-hook 'blacken-mode)
(setq blacken-line-length 120)
(add-hook 'python-mode-hook (lambda ()
    (add-hook 'before-save-hook 'blacken-buffer)))

(require 'py-isort)
(add-hook 'python-mode-hook (lambda ()
    (add-hook 'before-save-hook 'py-isort-before-save)))









;; disable elpy open
(define-key python-mode-map (kbd "<S-return>") 'undefined)
(define-key python-mode-map (kbd "<C-S-return>") 'undefined)
(define-key python-mode-map (kbd "<C-return>") 'undefined)
(define-key python-mode-map (kbd "<S-RET>") 'undefined)
(define-key python-mode-map (kbd "<C-S-RET>") 'undefined)
(define-key python-mode-map (kbd "<C-RET>") 'undefined)
(define-key python-mode-map (kbd "C-c C-p") 'undefined)

(define-key elpy-mode-map (kbd "<S-return>") 'undefined)
(define-key elpy-mode-map (kbd "<C-S-return>") 'undefined)
(define-key elpy-mode-map (kbd "<C-return>") 'undefined)
(define-key elpy-mode-map (kbd "<S-RET>") 'undefined)
(define-key elpy-mode-map (kbd "<C-S-RET>") 'undefined)
(define-key elpy-mode-map (kbd "<C-RET>") 'undefined)
(define-key elpy-mode-map (kbd "C-c C-p") 'undefined)


;; -----------------------
(require 'rst)
(add-hook 'text-mode-hook #'visual-line-mode)

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


;; -----------------------
;; key-bindings

;; key-bindings: built-ins
(global-set-key (kbd "C-c #") 'comment-region)
(global-set-key (kbd "C-x #") 'uncomment-region)
(global-set-key (kbd "C-x ^")  'delete-indentation)
(global-set-key (kbd "C-c v") 'browse-url-of-buffer)
(global-set-key (kbd "C-c C-a") 'auto-complete-mode)
(global-set-key (kbd "C-c C-e") 'load-file)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-c C-n") 'next-error)
(global-set-key (kbd "C-c C-p") 'previous-error)
(global-set-key (kbd "C-M-r") 'remember)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)
(global-set-key (kbd "C-x C-4") 'kill-buffer-and-window)
(global-set-key (kbd "C-x C-0") 'delete-window)
(global-set-key (kbd "C-,") 'beginning-of-buffer)
(global-set-key (kbd "C-.") 'end-of-buffer)
(global-set-key (kbd "C-x C-l") 'toggle-truncate-lines)

(global-set-key (kbd "C-c C-#") 'comment-region)
(global-set-key (kbd "C-c C-3") 'comment-region)
(global-set-key (kbd "C-x C-#") 'uncomment-region)
(global-set-key (kbd "C-c C-x C-3") 'uncomment-region)


;; key-bindings: my custom functions
(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)
(global-set-key (kbd "C-c M-d") 'duplicate-line)
(global-set-key (kbd "C-c C-c C-d") 'insert-current-date-time)
(global-set-key (kbd "C-c C-c C-t") 'insert-current-time)
(global-set-key (kbd "C-x C-g") 'egit-pretty-log)


;; key-bindings: function keys and installed extensions
(global-set-key (kbd "<f4>") 'keyboard-quit)
(global-set-key (kbd "<f5>") 'save-buffer)
(global-set-key (kbd "<f6>") 'kill-buffer)
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)
(global-set-key (kbd "<f8>") 'thea-goto-tests)
(global-set-key (kbd "S-<f8>") 'thea-goto-tests-to)
;; (global-set-key (kbd "<f9>") 'god-mode-all)
(global-set-key (kbd "C-<f4>") 'keyboard-quit)
(global-set-key (kbd "C-<f5>") 'save-buffer)
(global-set-key (kbd "C-<f6>") 'kill-buffer)
(global-set-key (kbd "C-<f8>") 'thea-goto-tests)
(global-set-key (kbd "C-S-<f8>") 'thea-goto-tests-to)
(global-set-key (kbd "C-<f7>") 'switch-to-minibuffer-window)
;; (global-set-key (kbd "C-<f9>") 'god-mode-all)


(global-set-key (kbd "C-c o") 'org-iswitchb)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)

(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)


(global-set-key (kbd "<C-return>") 'keyboard-quit)
(global-set-key (kbd "C-c C-x C-x") 'keyboard-quit)
(global-set-key (kbd "C-c C-z") 'keyboard-quit)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(charcoal))
 '(custom-safe-themes
   '("cdaa517a056a15a6c523771c6f643c51e0d307adf11efada64957bb4fd060f70" default))
 '(desktop-save-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-color "#383838")
 '(ispell-dictionary nil)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(realgud-ipdb realgud projectile rainbow-mode dired-rainbow py-autopep8 move-text charcoal-theme yaml-mode web-mode vimish-fold use-package tide symbol-overlay skewer-mode shackle rainbow-identifiers rainbow-delimiters rainbow-blocks python-docstring py-isort powerline pipenv markdown-preview-mode indium iedit go-mode elpy ein django-commands buffer-move blacken))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pop-up-windows nil)
 '(shackle-default-rule '(:same t))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


(setq-default mode-line-format
    (list "%e"
          'mode-line-front-space
          'mode-line-mule-info
          'mode-line-client
          'mode-line-modified
          'mode-line-remote
          'mode-line-frame-identification
          'mode-line-buffer-identification
          " "
          'mode-line-modes
          'mode-line-position
          ;; "  "
          'mode-line-misc-info
          'mode-line-end-spaces
          '(vc-mode vc-mode) ;; Version Control

          )
    )
