;;; init-completion.el --- Load completion -*- lexical-binding: t -*-
;;; Commentary:

;; Loads and configures ivy/counsel/swiper for completion

;;; Code:

(eval-and-compile
  (require 'subr-x))

(use-package counsel
  :init
  (use-package counsel-projectile)
  (use-package flx)
  (setq-default
   ivy-re-builders-alist '((t . ivy--regex-fuzzy))
   ivy-initial-inputs-alist nil)
  (ivy-mode t)
  :general
  (general-define-key
   :keymaps 'override
   :states '(normal visual motion)
   :prefix "SPC"
   "SPC" '(counsel-M-x :which-key "M-x")
   "p"   '(:ignore t :which-key "Project")
   "pf"  '(counsel-projectile-find-file :which-key "Find in project")
   "pp"  '(counsel-projectile-switch-project :which-key "Switch project")
   "f"   '(:ignore t :which-key "Files")
   "ff"  '(counsel-find-file :which-key "Find file")
   "s"   '(:ignore t :which-key "Search")
   "sp"  '(counsel-projectile-rg :which-key "Search in project")))

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-completion)
;; init-completion.el ends here
