(require 'org)
(require 'ox-html)
(require 'ox-md)
(require 'ox-latex)
(require 'ox-ascii)
;; (require 'ox-reveal)
;; (setq org-reveal-root "file:///home/leo/Programmes/reveal.js")

;(require 'ox-rss)
(setq org-agenda-files '("~/Dropbox/Documents/org"))

;; org for GTD
(setq org-directory "~/Dropbox/Documents/org/")
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(defun open-note ()
  "open or create a new note in ~/Dropbox/Documents/org/"
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

;;html setting
(setq org-html-inline-images t)

;;define blog template, it is just copyed from
;;org-html--build-meta-info and org-html-template
;;and remove something we don't need
(defun org-blogentry--build-meta-info (info)
  "Return meta tags for exported document.
INFO is a plist used as a communication channel."
  (let ((protect-string
	 (lambda (str)
	   (replace-regexp-in-string
	    "\"" "&quot;" (org-html-encode-plain-text str))))
	(title (org-export-data (plist-get info :title) info))
	(author (and (plist-get info :with-author)
		     (let ((auth (plist-get info :author)))
		       (and auth
			    ;; Return raw Org syntax, skipping non
			    ;; exportable objects.
			    (org-element-interpret-data
			     (org-element-map auth
				 (cons 'plain-text org-element-all-objects)
			       'identity info))))))
	(description (plist-get info :description))
	(keywords (plist-get info :keywords))
	(charset (or (and org-html-coding-system
			  (fboundp 'coding-system-get)
			  (coding-system-get org-html-coding-system
					     'mime-charset))
		     "iso-8859-1")))
    (concat
     (format "<title>%s</title>\n" title)
     (when (plist-get info :time-stamp-file)
       (format-time-string
	(concat "<!-- " org-html-metadata-timestamp-format " -->\n")))
     ;; (format
     ;;  (if (org-html-html5-p info)
     ;; 	  (org-html-close-tag "meta" " charset=\"%s\"" info)
     ;; 	(org-html-close-tag
     ;; 	 "meta" " http-equiv=\"Content-Type\" content=\"text/html;charset=%s\""
     ;; 	 info))
     ;;  charset)
     "\n"
      (org-html-close-tag "meta" " name=\"generator\" content=\"Org-mode\"" info)
      "\n"
      ;; here, pelican use contents instead of content for meta tag?!
      (and (org-string-nw-p author)
	   (concat
	    (org-html-close-tag "meta"
				(format " name=\"author\" contents=\"%s\""
					(funcall protect-string author))
				info)
	    "\n"))
      (and (org-string-nw-p description)
	   (concat
	    (org-html-close-tag "meta"
				(format " name=\"description\" content=\"%s\"\n"
					(funcall protect-string description))
				info)
	    "\n"))
      (and (org-string-nw-p keywords)
	   (concat
	    (org-html-close-tag "meta"
				(format " name=\"keywords\" content=\"%s\""
					(funcall protect-string keywords))
				info)
	    "\n")))))

(defun org-blogentry-template (contents info)
  "Return complete document string after HTML conversion.
CONTENTS is the transcoded contents string.  INFO is a plist
holding export options."
  (concat
   (when (and (not (org-html-html5-p info)) (org-html-xhtml-p info))
     (let ((decl (or (and (stringp org-html-xml-declaration)
			  org-html-xml-declaration)
		     (cdr (assoc (plist-get info :html-extension)
				 org-html-xml-declaration))
		     (cdr (assoc "html" org-html-xml-declaration))

		     "")))
       (when (not (or (eq nil decl) (string= "" decl)))
	 (format "%s\n"
		 (format decl
			 (or (and org-html-coding-system
				  (fboundp 'coding-system-get)
				  (coding-system-get org-html-coding-system 'mime-charset))
			     "iso-8859-1"))))))
   (org-html-doctype info)
   "\n"
   (concat "<html"
	   (when (org-html-xhtml-p info)
	     (format
	      " xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"%s\" xml:lang=\"%s\""
	      (plist-get info :language) (plist-get info :language)))
	   ">\n")
   "<head>\n"
   ;; (org-html--build-meta-info info)
   ;; change
   (org-blogentry--build-meta-info info)
   (org-html--build-head info)
   (org-html--build-mathjax-config info)
   "</head>\n"
   "<body>\n"
   (let ((link-up (org-trim (plist-get info :html-link-up)))
	 (link-home (org-trim (plist-get info :html-link-home))))
     (unless (and (string= link-up "") (string= link-home ""))
       (format org-html-home/up-format
	       (or link-up link-home)
	       (or link-home link-up))))
   ;; Preamble.
;;   (org-html--build-pre/postamble 'preamble info)
   ;; Document contents.
   (format "<%s id=\"%s\">\n"
	   (nth 1 (assq 'content org-html-divs))
	   (nth 2 (assq 'content org-html-divs)))
   ;; Document title.
   ;; (let ((title (plist-get info :title)))
   ;;   (format "<h1 class=\"title\">%s</h1>\n" (org-export-data (or title "") info)))
   contents
   (format "</%s>\n"
	   (nth 1 (assq 'content org-html-divs)))
   ;; Postamble.
;;   (org-html--build-pre/postamble 'postamble info)
   ;; Closing document.
   "</body>\n</html>"))

(org-export-define-derived-backend 'blogentry 'html
  :translate-alist '((template . org-blogentry-template)))

(defun org-blogentry-publish-to-html (plist filename pub-dir)
  (org-publish-org-to 'blogentry filename
		      (concat "." (or (plist-get plist :html-extension)
				      org-html-extension "html"))
		      plist pub-dir))
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
;         :publishing-function org-html-publish-to-html
	 :publishing-function org-blogentry-publish-to-html
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
(provide 'init-org)
