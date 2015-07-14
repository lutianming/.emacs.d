;;; init-org.el --- config org-mode
;;; Commentary:
;;; Code:

(require 'org)
(require 'ox-html)
(require 'ox-md)
(require 'ox-latex)
(require 'ox-beamer)
(require 'ox-ascii)
;; (require 'ox-rss)

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
;; (load "~/Workspace/ox-blog/ox-blog.el")



;;(setq org-reveal-root "file:///home/leo/Codes/reveal.js")
(setq org-reveal-root "http://lutianming.github.io/camera/reveal")
(setq org-reveal-hlevel 2)
(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")

;(require 'ox-rss)
(setq org-agenda-files '("~/Dropbox/org"))
(setq org-export-allow-bind-keywords t)
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


(setq org-latex-pdf-process
      '("texi2dvi --shell-escape -p -b -V %f"))

;;html setting
(setq org-html-inline-images t)

(setq org-src-fontify-natively t)
(setq org-list-allow-alphabetical t)
(provide 'init-org)
;;; init-org.el ends here
