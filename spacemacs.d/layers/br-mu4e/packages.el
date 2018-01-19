(setq br-mu4e-packages
      '(
        (mu4e :location site)
        mu4e-alert
        ))

(defun br-mu4e/post-init-mu4e ()
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
                      "Zaarly Inc"))))))))

(defun br-mu4e/post-init-mu4e-alert ()
  (with-eval-after-load 'mu4e-alert
    (mu4e-alert-set-default-style 'notifier)
    (setq mu4e-alert-interesting-mail-query
          (concat
           "flag:unread maildir:\"/personal/INBOX\" "
           "OR "
           "flag:unread maildir:\"/work/INBOX\""))))
