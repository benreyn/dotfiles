;;; config.el --- description -*- lexical-binding: t; -*-
(setq doom-font (font-spec :family "Menlo" :size 14))

(map! (:leader
        :desc "M-x" :nv "SPC"  #'execute-extended-command

        (:desc "search" :prefix "s"
          :desc "Project" :nv "p" #'helm-projectile-ag)

        (:desc "project" :prefix "p"
          :desc "Find file in project" :n "f" #'projectile-find-file)

        (:desc "git" :prefix "g"
          :desc "Magit status" :n "s" #'magit-status)

        (:desc "window" :prefix "w"
          :desc "Delete other windows" :n "m" #'delete-other-windows)))

(add-hook 'ruby-mode-hook #'rspec-verifiable-mode)

(provide 'config)
;;; config.el ends here
