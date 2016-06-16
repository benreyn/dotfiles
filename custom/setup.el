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

;; Lock files are annoying
(setq create-lockfiles nil)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

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

;; RSpec mode
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

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

;; Helm
(require 'helm-config)

;; Fiplr
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "tmp" "bower_components" "dist"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))

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
(setq-default fill-column 80) ;; Sets a 80 character line width
(setq inhibit-startup-screen t) ;; Don’t display the default splash screen
(setq large-file-warning-threshold nil) ;; Don’t warn me about opening large files
(setq x-select-enable-clipboard t) ;; Enable copy/past-ing from clipboard
(setq system-uses-terminfo nil) ;; Fix weird color escape sequences
(prefer-coding-system 'utf-8) ;; Prefer UTF-8 encoding
(fset 'yes-or-no-p 'y-or-n-p) ;; Answer with y and n instead of yes and no
(setq confirm-kill-emacs 'yes-or-no-p) ;; Ask for confirmation before closing emacs
(global-auto-revert-mode 1) ;; Always reload the file if it changed on disk
(setq-default line-spacing 1) ;; A nice line height
(show-paren-mode 1) ;; Highlight matching parens
(setq ns-use-srgb-colorspace t) ;; SRGB support for OSX
(tool-bar-mode 0) ;; Disable the toolbar

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

;; Quiet please! No dinging
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil 'invert-face 'mode-line)))

;; Org stuff
(require 'ox-gfm)
