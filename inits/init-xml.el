(add-to-list 'auto-mode-alist '("\\.html?" . nxml-mode))
(add-hook 'nxml-mode-hook 'turn-off-flyspell)
(setq nxml-child-indent 2)
(setq nxml-sl)
(setq nxml-slash-auto-complete-flag t)

(defun browse-buffer ()
  (interactive)
  (browse-url-firefox buffer-file-name))
(add-hook 'nxml-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c v") 'browse-buffer)))

(provide 'init-xml)
