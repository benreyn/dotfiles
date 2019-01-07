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
 inhibit-startup-message   t)

;; save custom file somewhere else
(setq custom-file
      (concat
       (file-name-directory user-emacs-directory) "custom.el"))
(unless (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)
