;;; init-core.el --- Load core files -*- lexical-binding: t -*-
;;; Commentary:

;; Loads core configuration files

;;; Code:

(require 'init-startup-optimizations)
(require 'init-use-package)
(require 'init-sane-defaults)
(require 'init-core-packages)
(require 'init-core-keybindings)
(require 'init-magit)
(require 'init-completion)
(require 'init-lsp)

(provide 'init-core)
;; init-core.el ends here
