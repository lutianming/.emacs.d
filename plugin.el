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
  (let ((result t))
    (dolist (p leo-packages result)
      (when (not (package-installed-p p))
        (setq result nil)
        (break)))
    (setq result result)))
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

;;--------------------helm--------------------
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)

(require 'projectile)
(projectile-global-mode)
;;--------------------autopair--------------------
(require 'autopair)
(autopair-global-mode)
(defun turn-off-autopair-mode () (autopair-mode -1))
(add-hook 'lisp-mode-hook 'turn-off-autopair-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-off-autopair-mode)

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
(setq-default yas-trigger-key "M-TAB")


;;----------dired----------------------
(require 'dired+)
(global-set-key (kbd "C-x d") 'diredp-dired-files)
(global-set-key (kbd "C-x C-d") 'diredp-dired-files-other-window)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(diredp-toggle-find-file-reuse-dir 1)

;;----------bookmark+----------
(require 'bookmark+)
;;----------auto-indent----------
;;(require 'auto-indent-mode)
;;(auto-indent-global-mode)

;;----------color-------------------------------------
;;(require 'zenburn-theme)
;;(load-theme 'zenburn t)
;;(require 'solarized)
(load-theme 'solarized-dark t)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;----------undo-tree----------
;;(require 'undo-tree)
(undo-tree-mode)


;;----------ido------------------------------------------
;; ido makes competing buffers and finding files easier
(ido-mode t)
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

;;----------ibuffer----------
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Programming" ;; prog stuff not already in MyProjectX
                (or
                 (mode . c-mode)
                 (mode . c++-mode)
                 (mode . python-mode)
                 (mode . emacs-lisp-mode)
                 (mode . lisp-mode)
                 (mode . sql-mode)
                 (mode . html-mode)
                 (mode . js2-mode)
                 (mode . pascal-mode)
                 (mode . makefile-gmake-mode)
                 (mode . nxml-mode)
                 (mode . yaml-mode)
                 (mode . sh-mode)
                 (mode . rst-mode)
                 (mode . go-mode)
                 (mode . po-mode)
                 (mode . css-mode)
                 ;; etc
                 ))
               ("Dired"
                (or
                 (mode . dired-mode)))
               ("Version Control"
                (or
                 (mode . magit-mode)
                 (name . "^*magit")
                 (mode . ahg-status-mode)))
               ("Org" ;; all org-related buffers
                (or
                 (mode . org-mode)
                 (mode . org-agenda-mode)
                 (mode . diary-mode)
                 (mode . calendar-mode)
                 (name . "^*Fancy Diary")
                 ))
               ("Emacs"
                (or
                 (name . "^\\*scratch\\*$")
                 (name . "^\\*Messages\\*$")
                 (name . "^\\*ielm\\*$")
                 (name . "^\\*Packages\\*$")
                 (mode . help-mode)))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))
