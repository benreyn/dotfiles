;;; init.el --- benreyn's configuration -*- lexical-binding: t -*-
;;; Commentary:

;; Bootstrap and load my emacs configuration

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-core)
(require 'init-langs)

;; Load theme
(use-package color-theme-sanityinc-tomorrow
  :config (load-theme 'sanityinc-tomorrow-eighties t))
