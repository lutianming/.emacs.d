(require 'package)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

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

;;check installed packages
(unless (leo-packages-installed-p)
  (message "%s" "refresh package database")
  (package-refresh-contents)
  (message "%s" "done")
  ;;install missing packages
  (dolist (p leo-packages)
    (when (not (package-installed-p p))
      (package-install p))))
;;----------end checking packages---------

(provide 'init-packages)
