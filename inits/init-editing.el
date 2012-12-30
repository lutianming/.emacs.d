(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "<f5>") 'find-file) ; Open file or dir
(global-set-key (kbd "<f6>") 'kill-this-buffer) ; Close file

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x k") 'kill-region)
(global-set-key (kbd "C-c k") 'kill-ring-save)
(global-set-key (kbd "C-.") 'undo-tree-undo)
(global-set-key (kbd "C-/") 'undo-tree-redo)

(global-set-key (kbd "M-;") 'comment-dwim)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;auto indent after yank
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      nxml-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(provide 'init-editing)
