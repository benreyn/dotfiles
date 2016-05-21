;; Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;; Load paths
(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/themes")

;; Color theme
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)

;; Load me some files!
(load "old-setup.el")
