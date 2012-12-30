(defvar *emacs-load-start* (current-time))
(require 'cl)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq debug-on-error t)

(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (expand-file-name
                         "inits" user-emacs-directory))

(require 'init-packages)
(require 'init-setup)
(require 'init-ido)
(require 'init-ibuffer)
(require 'init-dired)
(require 'init-misc)
(require 'init-magit)
(require 'init-code-complete)
(require 'init-theme)
(require 'init-blog)

(require 'buffer-defuns)
(require 'editing-defuns)
(require 'init-editing)

(require 'init-org)
(eval-after-load 'c++-mode '(require 'init-c))
(eval-after-load 'c-mode '(require 'init-c))
(eval-after-load 'python-mode '(require 'init-python))
(eval-after-load 'markdown-mode '(require 'init-markdown))
(eval-after-load 'octave-mode '(require 'init-octave))
(eval-after-load 'lisp-mode '(require 'init-lisp))
(eval-after-load 'TeX-mode '(require 'init-tex))
(eval-after-load 'html-mode '(require 'init-xml))
(eval-after-load 'xml-mode '(require 'init-xml))

(setq custom-file (expand-file-name
                   "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;;----start speed-----
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                                     (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
