;;--------------------python--------------------
(add-hook 'python-mode-hook
          '(lambda ()
             (push '(?' . ?')
                   (getf autopair-extra-pairs :code))
             (setq autopair-handle-action-fns
                   (list #'autopair-default-handle-action
                         #'autopair-python-triple-quote-action))))

(add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.0.8")
(setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.0.8/")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))
(setq py-shell-name "ipython")
(autoload 'python-mode "python-mode" "Python editing mode." t)

;; (require 'pymacs)
;; (setq pymacs-python-command py-python-command)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)


(require 'pycomplete)
;(require 'pysmell)
;(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))
