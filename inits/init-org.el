;;; init-org.el --- config org-mode
;;; Commentary:
;;; Code:

(require 'org)
(require 'ox-html)
(require 'ox-md)
(require 'ox-latex)
(require 'ox-ascii)

(require 'ox-reveal)
(setq org-reveal-root "file:///home/leo/Codes/reveal.js")
(setq org-reveal-hlevel 2)

;(require 'ox-rss)
(setq org-agenda-files '("~/Dropbox/org"))

;; org for GTD
(setq org-directory "~/Dropbox/org/")
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(defun open-note ()
  "open or create a new note in ~/Dropbox/org/"
  (interactive)
  (ido-find-file-in-dir org-directory))

(global-set-key (kbd "<f8>") 'org-capture)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "C-c C-f") 'open-note)

(setq org-use-fast-todo-selection t)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "leo.org") "Tasks")
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)
        ("n" "Note" entry (file (concat org-directory "leo.org") "Notes")
         "* %?\n")
        ("i" "Idea" entry (file (concat org-directory "leo.org") "Ideas")
         "* ")
        ("c" "Calendar" entry (file (concat org-directory "leo.org") "Calendar")
         "* %?\nEntered on %U\n  %i\n  %a")))

;;org to latex
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
      '(("frame" "lines")
	("linenos" "")))

;; (add-to-list 'org-export-latex-classes
;;              '("article"
;;                "\\documentclass{article}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-latex-pdf-process
      '("texi2dvi --shell-escape -p -b -V %f"))

;;html setting
(setq org-html-inline-images t)

;;org for blog
(setq org-publish-project-alist
      '(
	("pelican"
         ;; Path to your org files.
         :base-directory "~/Workspace/blog.raw/org"
         :base-extension "org"

         ;; Path to your blog project.
         :publishing-directory "~/Workspace/blog.raw/content/"
         :recursive t
         :htmlized-source t
	 :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
	 :html-head-include-default-style nil
	 :html-head-include-scripts nil
	 :html-postamble nil
	 :section-numbers nil
	 :auto-sitemap nil
;;         :body-only t ;; Only export section between <body> </body>
         :with-toc nil
         )
        ("org-static"
         :base-directory "~/Workspace/org/static"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
         :publishing-directory "~/Workspace/org/out"
         :recursive t
         :publishing-function org-publish-attachment)
	("org-blog"
         ;; Path to your org files.
         :base-directory "~/Workspace/org/"
         :base-extension "org"

         ;; Path to your blog project.
         :publishing-directory "~/Workspace/org/out"
         :recursive t
         :htmlized-source t
         :publishing-function org-html-publish-to-html
	 :html-link-home "index.html"
	 :html-link-up "sitemap.html"
         :headline-levels 4
         :html-extension "html"
	 :auto-preamble t
;;         :body-only t ;; Only export section between <body> </body>
	 :with-toc nil
	 :auto-sitemap t
	 :sitemap-file "sitemap.org"
	 :sitemap-title "Sitemap"
	 :sitemap-file-entry-format "%d %t"
	 :makeindex t
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"worg.css\"/>"
	 :infojs-opt "path:org-info.js"
	 :infojs-opt "toc:nil view:slide"
         )
        ("org" :components ("pelican" "org-blog" "org-static"))
        ))

(setq org-src-fontify-natively t)
(setq org-list-allow-alphabetical t)
(provide 'init-org)
;;; init-org.el ends here
