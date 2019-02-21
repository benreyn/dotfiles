;;; init-sane-defaults.el --- Default configurations -*- lexical-binding: t -*-
;;; Commentary:

;; Some sane configurations for emacs default UI / UX

;;; Code:

(menu-bar-mode -1)

(scroll-bar-mode -1)

(tool-bar-mode -1)

(add-to-list 'default-frame-alist
	     '(ns-transparent-titlebar . t))

(setq
 make-backup-files         nil
 auto-save-list-file-name  nil
 auto-save-default         nil
 inhibit-startup-message   t
 visible-bell              nil)

(set-face-attribute 'default nil :height 140)

(setq ring-bell-function
      (lambda ()
        (invert-face 'mode-line)
        (run-with-timer 0.1 nil 'invert-face 'mode-line)))

(setq custom-file
      (concat
       (file-name-directory user-emacs-directory) "custom.el"))
(unless (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)

(provide 'init-sane-defaults)
;;; init-sane-defaults.el ends here
