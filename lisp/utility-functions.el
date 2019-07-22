;;; utility-functions.el --- Some functions -*- lexical-binding: t -*-
;; Author: Benjamin Reynolds

;; URL: https://github.com/beneryn/.emacs.d

;;; Commentary:
;; This file is largely elisp expressions that I have found occasion to run
;; enough times to add them to this file and give a name to so that I can
;; add them to a keybinding or call them easily with M-x

;;; Code:

;; found at http://emacswiki.org/emacs/KillingBuffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(provide 'utility-functions)
