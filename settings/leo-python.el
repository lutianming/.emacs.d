;;--------------------python--------------------
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(require 'anything)


(add-hook 'python-mode-hook
          '(lambda ()
             (push '(?' . ?')
                   (getf autopair-extra-pairs :code))
             (setq autopair-handle-action-fns
                   (list #'autopair-default-handle-action
                         #'autopair-python-triple-quote-action))))
