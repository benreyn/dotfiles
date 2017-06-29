;; -*- mode: emacs-lisp -*-
;; My Spacemacs configuration
;; Author: Benjamin Reynolds

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     auto-completion
     better-defaults
     colors
     csv
     dash
     elixir
     emacs-lisp
     emoji
     git
     helm
     html
     javascript
     lua
     markdown
     org
     python
     ruby-on-rails
     scheme
     spell-checking
     sql
     syntax-checking
     vimscript
     yaml

     (mu4e :variables
           mu4e-account-alist t
           mu4e-enable-notifications t
           mu4e-enable-mode-line t)
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
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
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(sanityinc-tomorrow-eighties
                         sanityinc-tomorrow-night
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Menlo"
                               :size 12
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
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

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

  ;; mu4e
  (with-eval-after-load 'mu4e-alert
    (mu4e-alert-set-default-style 'notifier)
    (setq mu4e-alert-interesting-mail-query
      (concat
        "flag:unread maildir:\"/personal/INBOX\" "
        "OR "
        "flag:unread maildir:\"/work/INBOX\"")))

  ;; alert
  (with-eval-after-load 'alert
    (setq alert-notifier-default-icon
          (expand-file-name
          (concat user-emacs-directory "core/banners/img/spacemacs.png"))))

  ;; write custom-set-variables to a location I dont care about
  (setq custom-file (concat configuration-layer-private-directory "custom.el"))

  (setq mu4e-account-alist
        '(("personal"
           (user-mail-address "breyno127@gmail.com")
           (user-full-name "Benjamin Reynolds")
           (mu4e-sent-folder "/personal/sent")
           (mu4e-trash-folder "/personal/trash")
           (mu4e-drafts-folder "/personal/drafts")
           (mu4e-refile-folder "/personal/archive"))
          ("work"
           (user-mail-address "ben@zaarly.com")
           (user-full-name "Benjamin Reynolds")
           (mu4e-sent-folder "/work/sent")
           (mu4e-trash-folder "/work/trash")
           (mu4e-drafts-folder "/work/drafts")
           (mu4e-refile-folder "/work/archive"))))
  (mu4e/mail-account-reset)

  (setq mu4e-maildir "~/mail"
        mu4e-get-mail-command "offlineimap"
        mu4e-update-interval 180
        mu4e-compose-signature-auto-include nil
        mu4e-sent-messages-behavior 'sent
        mu4e-view-show-images t
        mu4e-view-show-addresses t)

  (setq mu4e-maildir-shortcuts
        '(("/personal/INBOX" . ?p)
          ("/work/INBOX"     . ?w)))

  (setq message-send-mail-function 'message-send-mail-with-sendmail)
  (setq sendmail-program "/usr/local/bin/msmtp")

  (spacemacs|define-custom-layout "@Dev"
    :binding "d")
  (spacemacs|define-custom-layout "@Terminals"
    :binding "t"
    :body
    (progn
      (call-interactively 'multi-term)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
