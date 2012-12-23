;;--------------------autopair--------------------
(require 'autopair)
(autopair-global-mode)
(defun turn-off-autopair-mode () (autopair-mode -1))
(add-hook 'lisp-mode-hook 'turn-off-autopair-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-off-autopair-mode)

;;----------auto-complete-----------------------------------
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map [return] nil)

;;---------yasnippet----------------
(require 'yasnippet)
(yas-global-mode)
(setq yas/root-directory "~/.emacs.d/mysnippets")
(yas/load-directory yas/root-directory)
(setq-default yas-trigger-key "M-TAB")

(provide 'init-code-complete)
