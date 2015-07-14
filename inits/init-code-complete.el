;;; init-code-complete.el --- config autocomplete and yasnippet
;;; Commentary:
;;; Code:

;;----------auto-complete-----------------------------------
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-auto-start t)
;; (define-key ac-complete-mode-map "\r" nil)
;; (define-key ac-complete-mode-map [return] nil)
;; (add-hook 'rust-mode-hook 'auto-complete-mode)

(electric-pair-mode 1)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase nil)
;; (global-company-mode)
;; (global-set-key (kbd "C-,") 'company-complete)

;;---------yasnippet----------------
(require 'yasnippet)
;; (setq yas-snippet-dirs  '("~/.emacs.d/mysnippets"))
(yas-global-mode 1)
(global-set-key (kbd "<M-tab>") 'yas-expand)

(provide 'init-code-complete)
;;; init-code-complete.el ends here
