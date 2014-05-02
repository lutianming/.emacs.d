;;; init-org.el --- config org-mode
;;; Commentary:
;;; Code:

(require 'org)
(require 'ox-html)
(require 'ox-md)
(require 'ox-latex)
(require 'ox-ascii)
(require 'ox-rss)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . nil)
   (ocaml . nil)
   (python . t)
   (ruby . nil)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . t)))

;;(require 'ox-reveal)
(load "~/Codes/org-reveal/ox-reveal.el")

;;(setq org-reveal-root "file:///home/leo/Codes/reveal.js")
(setq org-reveal-root "http://lutianming.github.io/camera/reveal")
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
        ("blog-static"
         :base-directory "~/Workspace/org/static"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
         :publishing-directory "~/Workspace/lutianming.github.io/static"
         :recursive t
         :publishing-function org-publish-attachment)

	("blog-post"
         ;; Path to your org files.
         :base-directory "~/Workspace/org/posts"
         :base-extension "org"

         ;; Path to your blog project.
         :publishing-directory "~/Workspace/lutianming.github.io"
         :recursive t
         :htmlized-source t
         :publishing-function org-html-publish-to-html
	 ;; :html-link-home "index.html"
         :headline-levels 4
         :html-extension "html"
	 :html-doctype "html5"
	 :section-number nil
	 :auto-preamble t
;;         :body-only t ;; Only export section between <body> </body>
	 :with-toc nil
	 :auto-sitemap t
	 :sitemap-sort-files "anti-chronologically"
	 :sitemap-filename "posts.org"
	 :sitemap-title ""
	 :sitemap-file-entry-format "%d %t"
	 :makeindex nil
	 :html-preamble blog-preamble
	 :html-postamble post-postamble
	 :html-head "<link rel=\"stylesheet\" href=\"static/css/pure-min.css\"/>\n<link rel=\"stylesheet\" href=\"static/css/style.css\"/>"
	 ;; :infojs-opt "path:static/js/org-info.js"
	 ;; :infojs-opt "toc:nil view:slide"
	 :exclude  "posts.org"
         )

	("blog-page"
         ;; Path to your org files.
         :base-directory "~/Workspace/org/"
         :base-extension "org"

         ;; Path to your blog project.
         :publishing-directory "~/Workspace/lutianming.github.io"
         :htmlized-source t
         :publishing-function org-html-publish-to-html
	 ;; :html-link-home "index.html"
         :headline-levels 4
         :html-extension "html"
	 :html-doctype "html5"
	 ;; :auto-preamble t
	 ;;         :body-only t ;; Only export section between <body> </body>
	 :html-preamble blog-preamble
	 :html-postamble page-postamble
	 :with-toc nil
	 :auto-sitemap nil
	 :makeindex nil
	 :html-head "<link rel=\"stylesheet\" href=\"static/css/pure-min.css\"/>\n<link rel=\"stylesheet\" href=\"static/css/style.css\"/>"
	 ;; :infojs-opt "path:static/js/org-info.js"
	 ;; :infojs-opt "toc:nil view:slide"
	 ;; :exclude  "index.org"
         )
	("blog-rss"
	 :base-directory "~/Workspace/org/posts"
	 :base-extension "org"
	 :publishing-directory "~/Workspace/lutianming.github.io"
	 :publishing-function org-rss-publish-to-rss
	 :html-link-home "lutianming.github.io"
	 :html-link-use-abs-url t
	 :with-toc nil
	 :rss-image-url nil
	 :rss-extension "xml"
	 :exclude ".*"
	 :include ("posts.org"))
        ("blog" :components ("blog-static" "blog-post" "blog-page" "blog-rss"))
        ))



(defun blog-preamble (options)
  "The function that creates the preamble menu for the blog.
OPTIONS contains the property list from the org-mode export."
  (let ((base-directory "~/Workspace/org"))
    (org-babel-with-temp-filebuffer (expand-file-name "html/preamble.html" base-directory) (buffer-string))))

(defun post-postamble (options)
  (let ((base-directory "~/Workspace/org"))
    (org-babel-with-temp-filebuffer (expand-file-name "html/post_postamble.html" base-directory) (buffer-string))))

(defun page-postamble (options)
  (let ((base-directory "~/Workspace/org"))
    (org-babel-with-temp-filebuffer (expand-file-name "html/page_postamble.html" base-directory) (buffer-string))))

(setq org-src-fontify-natively t)
(setq org-list-allow-alphabetical t)
(provide 'init-org)
;;; init-org.el ends here
