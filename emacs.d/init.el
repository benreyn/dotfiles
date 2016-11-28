;; Leave this here to make package.el happy
(package-initialize)

;; Cask
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'pallet)

;; Load paths
(add-to-list 'load-path "~/.emacs.d/custom")

;; Prevent writing package-selected-packages
(defun package--save-selected-packages (&rest opt) nil)

;; Load me some files!
(load "config.el")
