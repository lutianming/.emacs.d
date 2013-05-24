;;----------bookmark+----------
(require 'bookmark+)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;----------undo-tree----------
;;(require 'undo-tree)
(undo-tree-mode)

;;--------------------helm--------------------
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)

(require 'projectile)
(projectile-global-mode)

;----------w3m----------
;(require 'w3m-load)
;(require 'mime-w3m)

(require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode "Y"))
(eval-after-load "projectile" '(diminish 'projectile-mode "proj"))

;----------gnus---------
;(setq gnus-init-file '~/.emacs.d/gnus.el)

(require 'sr-speedbar)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-misc)
