;; -*- mode: emacs-lisp -*-
;; My Spacemacs configuration
;; Author: Benjamin Reynolds

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     auto-completion
     better-defaults
     calendar
     colors
     csv
     dash
     elixir
     emacs-lisp
     emoji
     ess
     git
     helm
     html
     javascript
     lua
     markdown
     nand2tetris
     pass
     prodigy
     python
     react
     ruby-on-rails
     rust
     scheme
     spell-checking
     sql
     swift
     vimscript
     yaml

     (mu4e :variables
           mu4e-enable-notifications t
           mu4e-enable-mode-line t)
     (org :variables
          org-enable-org-journal-support t)
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (syntax-checking :variables
                      syntax-checking-enable-by-default nil)
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left)

     ;; personal post-init configuration layers
     br-mu4e
     )
   dotspacemacs-additional-packages
   '(
     editorconfig
     emojify
     )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-use-spacelpa nil
   dotspacemacs-check-for-update nil
   dotspacemacs-verify-spacelpa-archives nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '((recents . nil)
                                (projects . nil))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(sanityinc-tomorrow-eighties
                         sanityinc-tomorrow-night
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Menlo"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers '(:relative t
                               :disabled-for-modes dired-mode
                                                   markdown-mode
                                                   org-mode
                               :size-limit-kb 1000)
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup 'trailing
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")
                                            ("org" . "orgmode.org/elpa/")
                                            ("gnu" . "elpa.gnu.org/packages/")))

  ;; write dotspacemacs/emacs-custom-settings to a location
  ;; I dont care about and load it
  (setq custom-file (concat configuration-layer-private-directory "custom.el"))
  (load-file custom-file)
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; multiple cursors are fun
  (global-evil-mc-mode)

  ;; JS indent
  (setq-default js2-basic-offset 2
                css-indent-offset 2
                web-mode-markup-indent-offset 2
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2
                web-mode-attr-indent-offset 2)

  ;; spaceline
  (setq powerline-default-separator 'utf-8)

  ;; editorconfig
  (use-package editorconfig
    :config
    (progn
      (spacemacs|diminish editorconfig-mode)
      (editorconfig-mode t)))

  ;; commit in insert state
  (add-hook 'git-commit-mode-hook 'evil-insert-state)

  ;; EMOJI!!
  (global-emojify-mode)

  ;; org
  (setq org-journal-dir "~/org")
  (setq org-agenda-files '("~/org"))
  (setq org-journal-file-format "%Y-%m-%d.org")
  (setq org-journal-date-prefix "#+TITLE: ")

  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d!)")))

  ;; alert
  (with-eval-after-load 'alert
    (setq alert-notifier-default-icon
          (expand-file-name
          (concat user-emacs-directory "core/banners/img/spacemacs.png"))))

  ;; Gcal
  (setq org-gcal-client-id (password-store-get "gcal/work/client-id")
        org-gcal-client-secret (password-store-get "gcal/work/client-secret"))

  (setq org-gcal-file-alist '(("ben@zaarly.com" . "~/org/ben-work.org")))

  ;; Prodigy
  (prodigy-define-service
    :name "Foreman"
    :command "foreman"
    :args '("start")
    :cwd "~/code/work/zweb/")

  (spacemacs|define-custom-layout "@Dev"
    :binding "d")
  (spacemacs|define-custom-layout "@Terminals"
    :binding "t"
    :body
    (progn
      (call-interactively 'multi-term)))

  ;; Lower gc-threshold:
  ;; Spacemacs raises this in its init.el to improve startup time and setting it
  ;; back to reasonable place should improve performance during regular use.
  (setq gc-cons-threshold 10000000)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
