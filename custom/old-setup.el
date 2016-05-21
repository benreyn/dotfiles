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
  (setq mac-command-modifier 'meta))

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

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
