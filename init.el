;;; emacs --- Ben's configuration -*- mode: emacs-lisp; -*-
;; Author: Benjamin Reynolds

;; URL: https://github.com/beneryn/.emacs.d

;;; Commentary:

;;; Code:

(package-initialize)

(setq gc-cons-threshold most-positive-fixnum)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose       t
      use-package-always-ensure t)

(require 'use-package)

;; some sane defaults
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq
 make-backup-files         nil
 auto-save-list-file-name  nil
 auto-save-default         nil
 inhibit-startup-message   t
 visible-bell              nil)

(setq ring-bell-function
      (lambda ()
        (invert-face 'mode-line)
        (run-with-timer 0.1 nil 'invert-face 'mode-line)))

;; Load theme
(use-package color-theme-sanityinc-tomorrow
  :config (load-theme 'sanityinc-tomorrow-eighties t))

;; Load evil
(use-package evil
  :init
  (use-package linum-relative)
  (use-package evil-surround
    :config
    (global-evil-surround-mode t))
  :config
  (evil-mode t))

;; which-key for browsing keybindings
(use-package which-key
  :init (which-key-mode))

;; general.el for keybinding
(use-package general
  :config
  (general-evil-setup t))

;; magit
(use-package magit
  :init
  (use-package evil-magit)
  :general
  (general-nmap
   :prefix "SPC"
   "g"  '(:ignore t :which-key "Git")
   "gs" '(magit-status :which-key "git status")))

;; save custom file somewhere else
(setq custom-file
      (concat
       (file-name-directory user-emacs-directory) "custom.el"))
(unless (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)
