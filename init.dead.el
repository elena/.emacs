(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/") t)

;; ;; (require 'package)
;; ;; (add-to-list 'package-archives
;; ;;              '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; ;; (add-to-list 'package-archives
;; ;;              '("melpa" . "http://melpa.org/packages/"))
;; ;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;; ;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;; ;;                          ("melpa" . "http://melpa.org/packages/")))

(defvar my-packages
  '(better-defaults
    auto-complete
    auto-complete-config
    ;; color-theme
    elpy
    ;; exec-path-from-shell
    ;; flycheck
    ;; flycheck-pyflakes
    ;; js3-mode
    ;; magit
    ;; markdown-mode
    ;; markdown-preview-mode
    py-autopep8
    ;; rainbow-delimiters
    recentf
    ;; smart-mode-line
    ;; web-mode
    ;; yaml-mode
    ;; yasnippet
    ))

;; ;; (when (not package-archive-contents)
;; ;;     (package-refresh-contents))
;; ;; (package-initialize)






;; (require 'golden-ratio)
;; (golden-ratio-mode 1)
;; (setq golden-ratio-auto-scale t)

;; Options have liked the look of at whatever stage.
;; (desktop-save-mode 1)
;; (split-window-horizontally)
;; (windmove-default-keybindings) ;; use shift-arrowkeys
;; (require 'framemove)
;; (framemove-default-keybindings) ;; default prefix is Meta
;; (setq pop-up-frames t)
;; (setq iswitchb-buffer-ignore '("^\\*"))



;; ;; Icicles
;; ;; Pretty, nice, but greedy.
;; ;;(require 'icicles)
;; ;;(icy-mode 1)
;; ;; (require 'doremi-cmd)


;;(add-to-list 'load-path "~/.emacs.d/yasnippet")
;;(require 'yasnippet)
;;(yas/global-mode 1)


;; (add-to-list 'load-path "~/emacs.d/lisp/emacs-for-python/") ;; tell where to load the various files
;; (require 'epy-setup)      ;; It will setup other loads, it is required!
;; (require 'epy-python)     ;; If you want the python facilities [optional]
;; ;; (require 'epy-completion) ;; If you want the autocompletion settings [optional]
;; (require 'epy-editing)    ;; For configurations related to editing [optional]
;; (require 'epy-bindings)   ;; For my suggested keybindings [optional]
;; (require 'epy-nose)       ;; For nose integratio
;; (epy-setup-ipython)
;; (epy-setup-checker "pyflakes %f")


;; * rainbow-mode *
;; ----------------
(add-hook 'less-css-mode-hook '(lambda () (rainbow-mode 1)))
(add-hook 'css-mode-hook '(lambda () (rainbow-mode 1)))
