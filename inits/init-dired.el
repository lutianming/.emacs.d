;;; init-dired.el --- config dired
;;; Commentary:
;;; Code:
(require 'dired+)
(global-set-key (kbd "C-x d") 'dired)
(global-set-key (kbd "C-x C-d") 'diredp-dired-files-other-window)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(diredp-toggle-find-file-reuse-dir 1)

(require 'dired-details)
(dired-details-install)

(provide 'init-dired)
;;; init-dired.el ends here
