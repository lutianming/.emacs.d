;;--------------------python--------------------
(add-hook 'python-mode-hook
          '(lambda ()
             (push '(?' . ?')
                   (getf autopair-extra-pairs :code))
             (setq autopair-handle-action-fns
                   (list #'autopair-default-handle-action
                         #'autopair-python-triple-quote-action))))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.0.9")
(setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.0.9/")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("ipython3" . python-mode))
(setq py-shell-name "/usr/bin/ipython3")
(autoload 'python-mode "python-mode" "Python editing mode." t)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))



(require 'pycomplete)
;(require 'pysmell)
;(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))
