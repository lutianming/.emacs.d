(global-set-key (kbd "<f5>") 'find-file) ; Open file or dir
(global-set-key (kbd "<f6>") 'kill-this-buffer) ; Close file

(global-set-key (kbd "<C-prior>") 'previous-user-buffer) ; Ctrl+PageUp
(global-set-key (kbd "<C-next>") 'next-user-buffer) ; Ctrl+PageDown
(global-set-key (kbd "<C-S-prior>") 'previous-emacs-buffer) ; Ctrl+Shift+PageUp
(global-set-key (kbd "<C-S-next>") 'next-emacs-buffer) ; Ctrl+Shift+PageDown

(global-set-key (kbd "C-x b") 'ido-switch-buffer)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x k") 'kill-region)
(global-set-key (kbd "C-c k") 'kill-ring-save)
(global-set-key (kbd "C-.") 'undo-tree-undo)
(global-set-key (kbd "C-/") 'undo-tree-redo)

(global-set-key (kbd "M-;") 'comment-dwim)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "RET") 'newline-and-indent)
