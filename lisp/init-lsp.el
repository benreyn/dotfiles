;;; init-lsp.el --- init lsp mode -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package lsp-mode
  :commands lsp
  :hook prog-mode
  :init
  (use-package lsp-ui)
  (use-package company-lsp)
  (setq lsp-prefer-flymake nil))

(provide 'init-lsp)
;; init-lsp.el ends here
