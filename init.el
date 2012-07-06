(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path "~/.emacs.d/plugins")
(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
(setq url-http-attempt-keepalives nil)
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

(load "setup")
(load "mydef")
(load "plugin")
(load "keymap")

(load "leo-c")
(if (eq system-type 'gnu/linux)
    (progn
      (load "leo-lisp")
      (load "leo-octave")
      (load "leo-tex")
      (load "leo-templates")))
(load "leo-python")
(if (eq system-type 'windows-nt)
    (setq magit-git-executable "D:\\Program Files (x86)\\Git\\bin\\git"))
