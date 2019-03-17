;;; init-magit.el --- Setup magit -*- lexical-binding: t -*-
;;; Commentary:

;; Setup magit and configure its keybindings

;;; Code:

(use-package magit
  :init
  (use-package evil-magit)
  :general
  (general-define-key
   :keymaps 'override
   :states '(normal visual motion)
   :prefix "SPC"
   "g"  '(:ignore t :which-key "Git")
   "gs" '(magit-status :which-key "git status")))

(provide 'init-magit)
;;; init-magit.el ends here
