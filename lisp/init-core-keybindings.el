;;; init-core-keybindings.el --- Load core files -*- lexical-binding: t -*-
;;; Commentary:

;; Loads core configuration files

;;; Code:

(general-define-key
 :states 'normal
 :prefix "SPC"
 "w"  '(:ignore t :which-key "Windows")
 "wV" 'split-window-right
 "wk" 'evil-window-up
 "wj" 'evil-window-down
 "wh" 'evil-window-left
 "wl" 'evil-window-right
 "wd" 'delete-window
 "b"  '(:ignore t :which-key "Buffers")
 "bd" 'kill-this-buffer)

(provide 'init-core-keybindings)
;; init-core-keybindings.el ends here
