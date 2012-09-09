;;----------el-get----------------------------------
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; (unless (require 'el-get nil t)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (end-of-buffer)
;;     (eval-print-last-sexp)))
;; (el-get)

;;----------------------------------------
;;check my packages, install them if they are not installed yet
(defvar leo-packages '(starter-kit starter-kit-bindings starter-kit-eshell
                                   ac-slime auctex auto-complete yasnippet dired+ flymake
                                   helm autopair projectile session
                                   magit smex popup undo-tree
                                   zenburn-theme solarized-theme))
(defun leo-packages-installed-p ()
  (loop for p in leo-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))
(unless (leo-packages-installed-p)
  (message "%s" "refresh package database")
  (package-refresh-contents)
  (message "%s" "done")
  ;;install missing packages
  (dolist (p leo-packages)
    (when (not (package-installed-p p))
      (package-install p))))
;;----------end checking packages---------
;;----------------------------------------------

;----------w3m----------
;(require 'w3m-load)
;(require 'mime-w3m)

;----------org----------
(require 'org)
(setq org-directory "~/SparkleShare/gtd/")
(global-set-key (kbd "<f8>") 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "task.org") "Tasks")
         "* TODO %?\n  \t %i\n %a")
        ("n" "Note" entry (file+headline (concat org-directory "note.org") "Notes")
         "* %?\n")
        ("i" "Idea" entry (file+headline (concat org-directory "task.org") "Ideas")
         "* ")
        ("c" "Calendar" entry (file+datetree (concat org-directory "calendar.org"))
         "* %?\nEntered on %U\n  %i\n  %a")))

;;--------------------helm--------------------
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(require 'projectile)
(projectile-global-mode)
;;--------------------autopair--------------------
(require 'autopair)
(autopair-global-mode)
(add-hook 'lisp-mode-hook
          '(lambda () (setq autopair-dont-activate t)))

;;----------auto-complete-----------------------------------
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map [return] nil)

;;---------yasnippet----------------
(require 'yasnippet)
(yas-global-mode)
(setq yas/root-directory "~/.emacs.d/mysnippets")
(yas/load-directory yas/root-directory)
(setq-default yas/trigger-key "M-TAB")


;;----------dired----------------------
(require 'dired+)
(setq dired-recursive-copies (quote top))
(setq dired-recursive-deletes (quote top))
(diredp-toggle-find-file-reuse-dir 1)

;;----------color-------------------------------------
;;(require 'zenburn-theme)
;;(load-theme 'zenburn t)
(require 'solarized)
(load-theme 'solarized-dark t)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;----------undo-tree----------
(require 'undo-tree)
(undo-tree-mode)

;;----------ido------------------------------------------
;; ido makes competing buffers and finding files easier
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq
  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-work-directory-list '("~/" "~/Workspace" "~/Documents" "~/src")
  ido-case-fold  t                 ; be case-insensitive

  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ido-enable-flex-matching nil     ; don't try to be too smart
  ido-max-prospects 8              ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#0C1021" :foreground "#F8F8F8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
