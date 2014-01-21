(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "<f5>") 'find-file) ; Open file or dir
(global-set-key (kbd "<f6>") 'kill-this-buffer) ; Close file

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x k") 'kill-region)
(global-set-key (kbd "C-c k") 'kill-ring-save)
(global-set-key (kbd "C-.") 'undo-tree-undo)
(global-set-key (kbd "C-/") 'undo-tree-redo)

(global-set-key (kbd "C-'") 'comment-dwim)

(global-set-key (kbd "M-j")
                (lambda ()
                  (join-line -1)))

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.emacs.d/backups" t)))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

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

(require 'expand-region)
(global-set-key (kbd "M-]") 'er/expand-region)
(global-set-key (kbd "M-[") 'er/contract-region)

(require 'region-bindings-mode)
(region-bindings-mode-enable)

(require 'multiple-cursors)

;;it seems it will automatively become editable
;;(define-key region-bindings-mode-map "e" 'mc/edit-lines)
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(provide 'init-editing)
