;;; pre-doom-init.el --- description -*- lexical-binding: t; -*-

(def-package-hook! helm
  :pre-init
  (setq helm-quick-update t
        helm-mode-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-apropos-fuzzy-match t
        helm-M-x-fuzzy-match t
        helm-recentf-fuzzy-match t
        helm-projectile-fuzzy-match t
        helm-display-header-line nil
        helm-ff-auto-update-initial-value nil
        helm-find-files-doc-header nil
        helm-mode-handle-completion-in-region nil
        helm-candidate-number-limit 100
        helm-move-to-line-cycle-in-source t) nil)

(provide 'pre-doom-init)
;;; pre-doom-init.el ends here
