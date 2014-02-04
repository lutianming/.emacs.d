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
(setq flyspell-issue-message-flag nil)

(add-hook 'org-mode-hook (lambda () (flyspell-mode)))
;; (add-hook 'prog-mode-hook (lambda () (flyspell-prog-mode)))
(provide 'init-spell)
;;; init-spell.el ends here
