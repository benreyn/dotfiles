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

;; Install packages
(setq package-list '(flymake
		flymake-css
		flymake-php 
		flymake-python-pyflakes 
		flymake-ruby 
		flymake-easy
		magit
		multiple-cursors
		php-mode
		yasnippet
		auto-complete
		popup
		web-mode
		emmet-mode))
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))                  
(package-initialize)
(condition-case err
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

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
      
;; Multiple cursors setup
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Setup web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
      )
(setq web-mode-enable-current-element-highlight t)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )


;; Add hooks
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'my-web-mode-hook)
