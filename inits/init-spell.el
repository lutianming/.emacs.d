;;; init-spell.el --- config ispell
;;; Commentary:
;;; Code:
(require 'ispell)
(setq ispell-program-name "ispell")
;;(setq ispell-extra-args '("--sug-mode=ultra"))
;; (setq ispell-program-name "hunspell")
;; (require 'rw-hunspell)

(require 'flyspell)
;;(setq ispell-list-command "list") ;;for aspell, seems this variable is removed
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'flyspell-mode)

(setq flyspell-issue-message-flag nil)

(provide 'init-spell)
;;; init-spell.el ends here
