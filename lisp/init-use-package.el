;;; init-use-package.el --- Bootstrap package management -*- lexical-binding: t -*-
;;; Commentary:

;; Bootstrap use-package to manage all other package downloads and initialization

;;; Code:

(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose       t
      use-package-always-ensure t)

(require 'use-package)

(provide 'init-use-package)
;;; init-use-package.el ends here
