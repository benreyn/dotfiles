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
     org
     pass
     python
     ruby-on-rails
     rust
     scheme
     slack
     spell-checking
     sql
     swift
     syntax-checking
     vimscript
     yaml

     (mu4e :variables
           mu4e-enable-notifications t
           mu4e-enable-mode-line t)
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left)
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
   dotspacemacs-check-for-update nil
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
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

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
  (with-eval-after-load 'mu4e
    (setq mu4e-get-mail-command "offlineimap"
          mu4e-update-interval 180
          mu4e-compose-signature-auto-include nil
          mu4e-sent-messages-behavior 'sent
          mu4e-view-show-images t
          mu4e-view-show-addresses t
          mu4e-maildir "~/mail"
          message-send-mail-function 'message-send-mail-with-sendmail
          sendmail-program "/usr/local/bin/msmtp")

    (setq mu4e-maildir-shortcuts
          '(("/personal/INBOX" . ?p)
            ("/work/INBOX"     . ?w)))

    (setq mu4e-contexts
          `( ,(make-mu4e-context
          :name "personal"
          :enter-func (lambda () (mu4e-message "Switch to the personal context"))
          :match-func (lambda (msg)
            (when msg
              (mu4e-message-contact-field-matches msg
                :to "breyno127@gmail.com")))
          :vars '(( user-mail-address  . "breyno127@gmail.com" )
                  ( user-full-name     . "Benjamin Reynolds"   )
                  ( mu4e-drafts-folder . "/personal/drafts"    )
                  ( mu4e-sent-folder   . "/personal/sent"      )
                  ( mu4e-trash-folder  . "/personal/trash"     )
                  ( mu4e-refile-folder . "/personal/archive"   )
                  ( mu4e-compose-signature .
                    (concat
                      "Thanks\n"
                      "BR"))))
             ,(make-mu4e-context
          :name "work"
          :enter-func (lambda () (mu4e-message "Switch to the work context"))
          :match-func (lambda (msg)
            (when msg
              (mu4e-message-contact-field-matches msg
                :to "ben@zaarly.com")))
          :vars '(( user-mail-address  . "ben@zaarly.com"    )
                  ( user-full-name     . "Benjamin Reynolds" )
                  ( mu4e-drafts-folder . "/work/drafts"      )
                  ( mu4e-sent-folder   . "/work/sent"        )
                  ( mu4e-trash-folder  . "/work/trash"       )
                  ( mu4e-refile-folder . "/work/archive"     )
                  ( mu4e-compose-signature .
                    (concat
                      "Benjamin Reynolds\n"
                      "Software Developer\n"
                      "Zaarly Inc")))))))

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

  (with-eval-after-load 'slack
    (slack-register-team
     :name "kcruby"
     :client-id (password-store-get "slack/kcruby/client-id")
     :client-secret (password-store-get "slack/kcruby/client-secret")
     :token (password-store-get "slack/kcruby/token")
     :display-profile-image t
     :modeline-enabled t
     :modeline-name "KC"
     :subscribed-channels '(general))

    (slack-register-team
    :name "Zaarly"
    :default t
    :client-id (password-store-get "slack/work/client-id")
    :client-secret (password-store-get "slack/work/client-secret")
    :token (password-store-get "slack/work/token")
    :display-profile-image t
    :modeline-enabled t
    :modeline-name "Z"
    :subscribed-channels '(general
                            dev
                            qa
                            random
                            kc)))

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
