;;; init-startup-optimizations.el --- Optimize startup time -*- lexical-binding: t -*-
;;; Commentary:

;; Increase garbage collection threshold's for the duration of emacs startup
;; and

;;; Code:

(defvar benreyn/original-gc-cons-threshold gc-cons-threshold)

(defvar benreyn/startup-gc-cons-threshold (* 256 1024 1024))

(defvar benreyn/original-file-name-handler-alist file-name-handler-alist)

(setq
 file-name-handler-alist nil
 gc-cons-threshold       benreyn/startup-gc-cons-threshold)


(defun benreyn/restore-startup-optimizations
    (setq
     file-name-handler-alist benreyn/original-file-name-handler-alist
     gc-cons-threshold       benreyn/original-gc-cons-threshold))

(add-hook 'emacs-startup-hook #'benreyn/restore-startup-optimizations)

(provide 'init-startup-optimizations)
;;; init-startup-optimizations.el ends here
