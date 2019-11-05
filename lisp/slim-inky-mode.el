;;; slim-inky-mode.el --- Add inky support to slim-mode

(defvar slim-inky-tags
  (append
   html-tags
   '("row" "columns" "container" "inky" "spacer" "wrapper" "column" "block-grid" "menu" "item"))
  "A list of valid HTML4/5 and custom inky component tag names")

(defvar slim-inky-tags-re
  (concat "^ *\\(" (regexp-opt slim-inky-tags 'words) "\/?\\)"))

(defconst slim-inky-font-lock-keywords
  (append
   (remove
    `(,html-tags-re
       1 font-lock-function-name-face)
    slim-font-lock-keywords)
   `((,slim-inky-tags-re
      1 font-lock-function-name-face))))

;;;###autoload
(define-derived-mode slim-inky-mode slim-mode "Slim Inky"
  "Major mode for editing Slim Inky files.
\\{slim-inky-mode-map}"
  (setq font-lock-defaults '((slim-inky-font-lock-keywords) nil t)))

(provide 'slim-inky-mode)
;;; slim-inky-mode.el ends here
