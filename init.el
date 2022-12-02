(setq custom-file "~/.emacs.d/custom.el")
(ignore-errors (load custom-file))

(setenv "PATH" (concat (getenv "PATH") ":/Users/tianlu/bin:/usr/local/bin"))
(setq exec-path (append exec-path '("/Users/tianlu/bin")))
(setq exec-path (append exec-path '("/usr/local/bin")))

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


(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package markdown-mode
  :ensure t
  :init
  (setq markdown-command '("pandoc" "--from=markdown" "--to=html5"))
  :config
  (add-to-list 'eglot-server-programs '(markdown-mode . ("marksman")))
  (add-hook 'markdown-mode-hook #'eglot-ensure))

;; Enable vertico
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-mode))

(use-package embark
  :ensure t

  :bind
  (("C-'" . embark-act)         ;; pick some comfortable binding
   ("C-]" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package avy
  :config
  (global-set-key (kbd "C-;") 'avy-goto-char-2))
