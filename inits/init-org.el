;----------org----------
(setq org-directory "~/Dropbox/Documents/org/")
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(defun open-note ()
  "open or create a new note in ~/Dropbox/Documents/org/"
  (interactive)
  (ido-find-file-in-dir org-directory))

(global-set-key (kbd "<f8>") 'org-capture)
(global-set-key (kbd "C-c C-f") 'open-note)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "task.org") "Tasks")
         "* TODO %?\n  \t %i\n %a")
        ("n" "Note" entry (file+headline (concat org-directory "note.org") "Notes")
         "* %?\n")
        ("i" "Idea" entry (file+headline (concat org-directory "task.org") "Ideas")
         "* ")
        ("c" "Calendar" entry (file+datetree (concat org-directory "calendar.org"))
         "* %?\nEntered on %U\n  %i\n  %a")))

;;org to latex
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))

;;org to html
(setq org-publish-project-alist
      '(

        ("blog"
         ;; Path to your org files.
         :base-directory "~/Workspace/blog.raw/org"
         :base-extension "org"

         ;; Path to your blog project.
         :publishing-directory "~/Workspace/blog.raw/content"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )

        ;; ("org-static"
        ;;  :base-directory "~/Workspace/blog.raw/output/theme"
        ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
        ;;  :publishing-directory "~/Workspace/lutianming.github.com/assets"
        ;;  :recursive t
        ;;  :publishing-function org-publish-attachment)

        ("org" :components ("blog"))
        ))

(provide 'init-org)
