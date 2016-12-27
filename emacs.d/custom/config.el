;; Sensible-defaults
(load-file "~/code/personal/sensible-defaults.el/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

;; Theme
(load-theme 'sanityinc-tomorrow-eighties t)

;; Turn off splash screen and mouse interface
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;; Show row / column numbers
(line-number-mode t)
(column-number-mode t)

;; Highlighy current line
(when window-system
  (global-hl-line-mode))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; ido and flx ido
(ido-mode t)
(setq ido-enable-flex-matching t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; ido vertical
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Set mac command key
(when is-mac
  (setq mac-command-modifier 'meta))

;; Lock files are annoying
(setq create-lockfiles nil)

;; Multiple cursors setup
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; Add hooks
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'js-mode-hook (lambda () (ember-mode t)))
(add-hook 'web-mode-hook (lambda () (ember-mode t)))

;; Autocomplete
(ac-config-default)

;; Gimme my shell
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; ember-mode
(require 'cl)
(require 'ember-mode)
(add-hook 'js-mode-hook (lambda () (ember-mode t)))
(add-hook 'web-mode-hook (lambda () (ember-mode t)))

;; Autocomplete
(ac-config-default)

;; RSpec mode
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(add-hook 'yaml-mode-hook 'rspec-mode)
(add-hook 'slim-mode-hook 'rspec-mode)

;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)

;; Setup web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Tab settings
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)

;; Resizing windows should be easy
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Scroll Margins
(setq scroll-margin 5
     scroll-preserve-screen-position 1)

;; File path in window name
(setq-default frame-title-format '((:eval (if (buffer-file-name)
                                              (abbreviate-file-name (buffer-file-name)) "%f"))))

(scroll-bar-mode 0) ;; Disables the scroll bar
(setq large-file-warning-threshold nil) ;; Don’t warn me about opening large files
(setq x-select-enable-clipboard t) ;; Enable copy/past-ing from clipboard
(setq system-uses-terminfo nil) ;; Fix weird color escape sequences
(prefer-coding-system 'utf-8) ;; Prefer UTF-8 encoding
(setq-default line-spacing 1) ;; A nice line height
(setq ns-use-srgb-colorspace t) ;; SRGB support for OSX
(tool-bar-mode 0) ;; Disable the toolbar
(setq require-final-newline t) ;; Avoid stlye issues with final newline
(setq ruby-insert-encoding-magic-comment nil) ;; Don't auto-add encoding comments

;; Open splits horizontally
(setq split-height-threshold 0)
(setq split-width-threshold nil)

(set-fringe-mode '(10 . 0)) ;; Show a nice fringe

;; Remove the fringe indicators
(when (boundp 'fringe-indicator-alist)
  (setq-default fringe-indicator-alist
        '(
          (continuation . nil)
          (overlay-arrow . nil)
          (up . nil)
          (down . nil)
          (top . nil)
          (bottom . nil)
          (top-bottom . nil)
          (empty-line . nil)
          (unknown . nil))))

;; Default frame size
(setq initial-frame-alist
      '((top . 10) (left . 50) (width . 185) (height . 55)))

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Always use two spaces to indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

;; Making dabbrev a bit nicer
(setq dabbrev-abbrev-skip-leading-regexp ":")
(setq dabbrev-backward-only t)

;; Override sensible-defaults bell with custom mode-line flash
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil 'invert-face 'mode-line)))

;; Org stuff
(require 'ox-gfm)

;; rspec mode conig
(setq compilation-scroll-output t)

;; Git gutter
(global-git-gutter-mode +1)
(git-gutter:linum-setup)
(custom-set-variables
 '(git-gutter:update-interval 2))

;; editorconfig
(editorconfig-mode 1)
(add-hook 'editorconfig-custom-hooks
  (lambda (hash) (setq web-mode-block-padding 0)))

;; Flycheck
(global-flycheck-mode)

;; Bash auto-completion
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
  'bash-completion-dynamic-complete)

;; Projectile
(projectile-global-mode)
(projectile-rails-global-mode)
(global-set-key (kbd "C-x f") 'projectile-find-file)
(global-set-key (kbd "C-x F") 'projectile-ag)

;; Steal some stuff from https://github.com/hrs/dotfiles
(defun hrs/split-window-below-and-switch ()
  "Split the window horizontally, then switch to the new pane."
  (interactive)
  (split-window-below)
  (other-window 1))

(defun hrs/split-window-right-and-switch ()
  "Split the window vertically, then switch to the new pane."
  (interactive)
  (split-window-right)
  (other-window 1))

(defun hrs/visit-last-dired-file ()
  "Open the last file in an open dired buffer."
  (end-of-buffer)
  (previous-line)
  (dired-find-file))

(defun hrs/visit-last-migration ()
  "Open the last file in 'db/migrate/'. Relies on projectile. Pretty sloppy."
  (interactive)
  (dired (expand-file-name "db/migrate" (projectile-project-root)))
  (hrs/visit-last-dired-file)
  (kill-buffer "migrate"))


(defun hrs/de-unicode ()
  "Tidy up a buffer by replacing all special Unicode characters
     (smart quotes, etc.) with their more sane cousins"
  (interactive)
  (let ((unicode-map '(("[\u2018\|\u2019\|\u201A\|\uFFFD]" . "'")
                       ("[\u201c\|\u201d\|\u201e]" . "\"")
                       ("\u2013" . "--")
                       ("\u2014" . "---")
                       ("\u2026" . "...")
                       ("\u00A9" . "(c)")
                       ("\u00AE" . "(r)")
                       ("\u2122" . "TM")
                       ("[\u02DC\|\u00A0]" . " "))))
    (save-excursion
      (loop for (key . value) in unicode-map
            do
            (goto-char (point-min))
            (replace-regexp key value)))))

(eval-after-load 'ag
  '(define-key ag-mode-map
    (kbd "C-x C-q") 'wgrep-change-to-wgrep-mode))

(eval-after-load 'wgrep
  '(define-key grep-mode-map
    (kbd "C-c C-c") 'wgrep-finish-edit))

(setq wgrep-auto-save-buffer t)

(global-set-key (kbd "C-x 2") 'hrs/split-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'hrs/split-window-right-and-switch)

;; Diminish many of the minor modes that are active on most buffers
(defmacro diminish-minor-mode (filename mode &optional abbrev)
  `(eval-after-load (symbol-name ,filename)
     '(diminish ,mode ,abbrev)))

(defmacro diminish-major-mode (mode-hook abbrev)
  `(add-hook ,mode-hook
             (lambda () (setq mode-name ,abbrev))))

(diminish-minor-mode 'projectile 'projectile-mode)
(diminish-minor-mode 'subword 'subword-mode)
(diminish-minor-mode 'git-gutter 'git-gutter-mode)
(diminish-minor-mode 'auto-complete 'auto-complete-mode)
(diminish-minor-mode 'autorevert 'auto-revert-mode)
(diminish-minor-mode 'ruby-end 'ruby-end-mode)

(diminish-major-mode 'emacs-lisp-mode-hook "el")
(diminish-major-mode 'lisp-interaction-mode-hook "λ")

;; mu4e
(require 'mu4e )
(global-set-key (kbd "C-x m") 'mu4e)

(setq mu4e-contexts
      `( ,(make-mu4e-context
      :name "personal"
      :enter-func (lambda () (mu4e-message "Switch to the personal context"))
      :match-func (lambda (msg)
        (when msg
          (mu4e-message-contact-field-matches msg
            :to "breyno127@gmail.com")))
      :vars '(( user-mail-address . "breyno127@gmail.com" )
              ( user-full-name    . "Benjamin Reynolds"   )
              ( mu4e-maildir      . "~/mail/personal"     )
              ( mu4e-mu-home      . "~/.mu/personal"      )
              ( mu4e-compose-signature .
                 (concat
                   "Benjamin Reynolds\n"
                   "Software Developer"))))
         ,(make-mu4e-context
      :name "work"
      :enter-func (lambda () (mu4e-message "Switch to the work context"))
      :match-func (lambda (msg)
        (when msg
          (mu4e-message-contact-field-matches msg
            :to "ben@zaarly.com")))
       :vars '(( user-mail-address . "ben@zaarly.com"    )
               ( user-full-name    . "Benjamin Reynolds" )
               ( mu4e-maildir      . "~/mail/work"       )
               ( mu4e-mu-home      . "~/.mu/work"        )
               ( mu4e-compose-signature .
                 (concat
                  "Benjamin Reynolds\n"
                  "Software Developer\n"
                  "Zaarly Inc"))))))

(setq mu4e-drafts-folder "/drafts")
(setq mu4e-sent-folder   "/sent")
(setq mu4e-trash-folder  "/trash")
(setq mu4e-refile-folder "/archive")
(setq mu4e-sent-messages-behavior 'delete)

(setq mu4e-maildir-shortcuts
    '( ("/INBOX"     . ?i)
       ("/sent"      . ?s)
       ("/trash"     . ?t)
       ("/archive"   . ?a)))

(setq mu4e-get-mail-command "offlineimap")
(setq mu4e-update-interval 180)

(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/local/bin/msmtp")

(setq message-kill-buffer-on-exit t)

;; mu4e notifications
(setq mu4e-alert-interesting-mail-query
      (concat
       "flag:unread"
       " AND NOT flag:trashed"
       " AND maildir:"
       "\"/INBOX\""))

(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

;; start a server after launch
(server-start)
