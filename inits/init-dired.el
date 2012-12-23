;;----------dired----------------------
(require 'dired+)
(global-set-key (kbd "C-x d") 'diredp-dired-files)
(global-set-key (kbd "C-x C-d") 'diredp-dired-files-other-window)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(diredp-toggle-find-file-reuse-dir 1)

(provide 'init-dired)
