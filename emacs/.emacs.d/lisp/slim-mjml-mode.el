;;; slim-mjml-mode.el --- Add inky support to slim-mode

(defvar slim-mjml-tags
  (append
   html-tags
   '(
     "mjml"
     ))
  "A list of valid HTML4/5 and custom mjml component tag names")

(defvar slim-mjml-tags-re
  (concat "^ *\\(" (regexp-opt slim-mjml-tags 'words) "\/?\\)"
	  ))

(defconst slim-mjml-font-lock-keywords
  (append
   (remove
    `(,html-tags-re
       1 font-lock-function-name-face)
    slim-font-lock-keywords)
   `((,slim-mjml-tags-re
      1 font-lock-function-name-face))
   `((,"^ *\\(\\<\\(mj-[^ \t\r\n\v\f]+\\)\\>\/?\\)"
      1 font-lock-function-name-face))))

;;;###autoload
(define-derived-mode slim-mjml-mode slim-mode "Slim Mjml"
  "Major mode for editing Slim Mjml files.
\\{slim-mjml-mode-map}"
  (setq font-lock-defaults '((slim-mjml-font-lock-keywords) nil t)))

(provide 'slim-mjml-mode)
;;; slim-mjml-mode.el ends here
