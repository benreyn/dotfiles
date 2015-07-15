;; Turn off splash screen and mouse interface
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;; Show row / column numbers
(line-number-mode t)
(column-number-mode t)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; ido mode
  (ido-mode t)
  (setq ido-enable-flex-matching t)
  
;; Set mac command key
(when is-mac
  (setq mac-command-modifier 'control))

;; Load Paths
(add-to-list 'load-path "~/.emacs.d/themes/")

;; Color Theme
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)

;; Install packages with error handling for my work computer
(setq package-list '(popup
		     auto-complete
		     chess
		     emmet-mode
		     php-mode
		     yasnippet))
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))                  
(package-initialize)
(condition-case err
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
(debug error) nil)

;; Version control and backup file management
(setq
   backup-by-copying t
   backup-directory-alist
   '(("." . "~/.temp"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)
(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

;; Add hooks
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
