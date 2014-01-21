;----------slime----------
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime-autoloads)

(slime-setup)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(setq w3m-use-cookies t)
(setq w3m-coding-system 'utf-8
          w3m-file-coding-system 'utf-8
          w3m-file-name-coding-system 'utf-8
          w3m-input-coding-system 'utf-8
          w3m-output-coding-system 'utf-8
          w3m-terminal-coding-system 'utf-8)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)
(defun process-available-input (stream fn)
  (when (open-stream-p stream)
    (loop do (funcall fn)
          while (and (open-stream-p stream) (listen stream)))))

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(require 'paredit)
(define-key paredit-mode-map (kbd "M-(") 'paredit-wrap-round)

(provide 'init-lisp)
