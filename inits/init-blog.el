(defun new-blog (title)
  (interactive "Bblog-title:")
  (find-file (concat
              "~/Workspace/blog.raw/org/"
              (format-time-string "%Y-%m-%d-")
              title
              ".org")))

(provide 'init-blog)
