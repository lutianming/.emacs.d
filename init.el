;;; init.el --- emacs config file
;;; Commentary:
;;; Code:

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(require 'cl)

;; server mode
(require 'server)
(unless (server-running-p)
  (server-start))

(setq debug-on-error t)

;; Set up load
(add-to-list 'load-path (expand-file-name
                         "inits" user-emacs-directory))



(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'init-packages)

(require 'init-spell)
(require 'init-code-complete)
(require 'init-pair)

(require 'init-dired)
(require 'init-window)
(require 'init-misc)
(require 'init-git)

(require 'init-ibuffer)
;;ido or helm, make the choice
;;(require 'init-ido)
(require 'init-helm)

(require 'init-theme)
(require 'init-blog)

(require 'buffer-defuns)
(require 'editing-defuns)
(require 'init-editing)
(require 'init-term)

;;settings for different languages
(require 'init-scala)
(require 'init-web)
(require 'init-org)
(require 'init-python)
(require 'init-markdown)
(require 'init-octave)
(require 'init-lisp)
(require 'init-tex)
(require 'init-js)
(require 'init-rust)
;;(eval-after-load 'org '(require 'init-org))
;;(eval-after-load 'nxml-mode '(require 'init-xml))
;;(eval-after-load 'cc-mode'(require 'init-cc))
;; (eval-after-load 'python-mode '(require 'init-python))
;; (eval-after-load 'markdown-mode '(require 'init-markdown))
;; (eval-after-load 'octave-mode '(require 'init-octave))
;; (eval-after-load 'lisp-mode '(require 'init-lisp))
;; (eval-after-load 'emacs-lisp '(require 'init-lisp))
;; (eval-after-load 'TeX-mode '(require 'init-tex))
;; (eval-after-load 'js3-mode '(require 'init-js))

;; Keep emacs Custom-settings in separate file
(require 'init-setup)
(require 'init-hydra)
(setq custom-file (expand-file-name
                   "custom.el" user-emacs-directory))
(load custom-file 'noerror)
;;; init.el ends here
