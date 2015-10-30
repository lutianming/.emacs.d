;;; init-web.el --- config web-mode
;;; Commentary:
;;; Code:
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(setq web-mode-engines-alist
      '(("php" . "\\.phtml\\'")
	("blade" . "\\.blade\\'")
	("jinja2" . "\\.html\\'")))

(setq web-mode-enable-auto-opening t)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-quoting t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-indentation t)
(setq web-mode-enable-engine-detection t)
;(setq web-mode-markup-indent-offset 4)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(provide 'init-web)
;;; init-web.el ends here
