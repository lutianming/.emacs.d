;----------file-templates----------
(auto-insert-mode t)
(setq auto-insert-directory (concat (getenv "HOME") "/Templates/"))
(add-hook 'find-file-hook 'auto-insert)
(setq auto-insert-query nil)
(setq auto-insert-alist
      '(
        ("\\.h$"   . ["header_template.h" auto-update-header-file])
        ("\\.c$"   . ["c_template.c" auto-update-c-source-file])
        ("\\.cpp$" . ["c_template.c" auto-update-c-source-file])
        ("\\.py$"  . ["py_template.py"])
        ("\\.sh$"  . ["sh_template.sh"])
        ))

(defun auto-update-header-file()
  (save-excursion
    (while (search-forward "GUARD" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (upcase (file-name-nondirectory buffer-file-name)))
        (subst-char-in-region (point-min) (point-max) ?. ?_))))
  (save-excursion
    ;; replace DDDD with today's date
    (while (search-forward "YY-MM-DD" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match "")
        (insert-today)
        ))))

(defun insert-today()
  (interactive)
  (insert (format-time-string "%Y-%m-%d, %a" (current-time))))
(defun auto-update-c-source-file()
  (save-excursion
    ;;replace HHHH with head file
    (while (search-forward "HHHH" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".h") t))))
  (save-excursion
    ;; replace DDDD with today's date
    (while (search-forward "YY-MM-DD" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match "")
        (insert-today)))))

(provide 'init-templates)
