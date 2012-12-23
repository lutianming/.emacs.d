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

(provide 'init-misc)