(defalias 'yes-or-no-p 'y-or-n-p)

;;----------bookmark+----------
(require 'bookmark+)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;----------undo-tree----------
(require 'undo-tree)
(undo-tree-mode)


;----------w3m----------
(require 'w3m)
(setq browse-url-browser-function 'w3m-browse-url)

;; (require 'diminish)
;; (eval-after-load "yasnippet" '(diminish 'yas-minor-mode "Y"))
;; (eval-after-load "projectile" '(diminish 'projectile-mode "proj"))

;----------gnus---------
;(setq gnus-init-file '~/.emacs.d/gnus.el)

(require 'sr-speedbar)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-misc)
