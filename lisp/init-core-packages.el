;;; init-core-packages.el --- Setup core packages -*- lexical-binding: t -*-
;;; Commentary:

;; Setup evil-mode, which-key, and general.el

;;; Code:

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(use-package evil
  :init
  (use-package linum-relative)
  (use-package evil-surround
    :config
    (global-evil-surround-mode t))
  :config
  (evil-mode t))

(use-package which-key
  :init (which-key-mode))

(use-package general
  :config
  (general-evil-setup t))

(use-package projectile
  :init
  (projectile-mode t))

(use-package smartparens
  :init
  (require 'smartparens-config)
  (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package doom-modeline
  :init
  (setq doom-modeline-height 22)
  :hook (after-init . doom-modeline-mode))

(use-package flycheck)

(provide 'init-core-packages)
;;; init-core-packages.el ends here
