(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path "~/.emacs.d/plugins")
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
(load "leo-lisp")
(load "leo-octave")
(load "leo-python")
(load "leo-tex")
(load "leo-templates")
