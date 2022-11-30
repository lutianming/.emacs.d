(setq custom-file "~/.emacs.d/custom.el")
(ignore-errors (load custom-file))

(require 'package)

;; Internet repositories for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

;; Actually get “package” to work.
(package-initialize)
(package-refresh-contents :async)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :defer 10
  :config
  ;; Delete residual old versions
  (setq auto-package-update-delete-old-versions t)
  ;; Do not bother me when updates have taken place.
  (setq auto-package-update-hide-results t)
  ;; Update installed packages at startup if there is an update pending.
  (auto-package-update-maybe))

(use-package magit
  :defer t
  :custom ;; Do not ask about this variable when cloning.
  (magit-clone-set-remote.pushDefault t))

(use-package evil)
(evil-mode t)
;; Enable "M-x" in evil mode
(global-set-key (kbd "M-x") 'execute-extended-command)


(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))
