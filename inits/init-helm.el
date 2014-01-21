;;; init-helm.el --- config helm and helm related extensions
;;; Commentary:
;;; Code:
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x f") 'helm-for-files)

(helm-mode 1)

(require 'helm-dash)
(setq helm-dash-common-docsets '("Python_3"))

(provide 'init-helm)
;;; init-helm.el ends here
