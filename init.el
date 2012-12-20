(defvar *emacs-load-start* (current-time))
(require 'cl)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq debug-on-error t)
(add-to-list 'load-path "~/.emacs.d")

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

(load "plugin")
;; (load "setup")
;; (load "mydef")
;; (load "keymap")

(eval-after-load 'load-dir
  '(progn
     (setq load-dirs "~/.emacs.d/settings")))
;; (load "leo-xml")
;; (load "leo-c")
;; (load "leo-org")
;; (if (eq system-type 'gnu/linux)
;;     (progn
;;       (load "leo-lisp")
;;       (load "leo-octave")
;;       (load "leo-haskell")
;;       (load "leo-tex")
;;       (load "leo-templates")))
;; (load "leo-python")
(if (eq system-type 'windows-nt)
    (setq magit-git-executable "D:\\Program Files (x86)\\Git\\bin\\git"))

(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
