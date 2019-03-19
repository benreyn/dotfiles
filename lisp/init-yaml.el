;;; init-yaml.el --- Setup YAML support -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package yaml-mode
  :mode
  (("\\.\\(yml\\|yaml\\)\\'" . yaml-mode)
   ("Procfile\\'" . yaml-mode))
  :config
  (add-hook 'yaml-mode-hook
	    '(lambda ()
	       (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(provide 'init-yaml)
;;; init-yaml.el ends here

