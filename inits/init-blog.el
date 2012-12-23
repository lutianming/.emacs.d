(defun new-blog (title)
  (interactive "Bblog-title:")
  (find-file (concat
              "~/Workspace/lutianming.github.com/org/"
              (format-time-string "%Y-%m-%d-")
              title
              ".org")))

(provide 'init-blog)
