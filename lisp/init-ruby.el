;;; init-ruby.el --- Setup ruby support -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package rspec-mode
  :init
  (use-package inf-ruby
    :init
    (add-hook 'after-init-hook 'inf-ruby-switch-setup))
  :general
  (general-nmap
   :prefix "SPC"
   "r"     '(:ignore t :which-key "Rspec")
   "r TAB" 'rspec-toggle-spec-and-target
   "ra"    'rspec-verify-all
   "rr"    'rspec-rerun
   "rm"    'rspec-verify-matching
   "rf"    'rspec-run-last-failed))

(provide 'init-ruby)
;;; init-ruby.el ends here
