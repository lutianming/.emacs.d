;;--------------------python--------------------
(add-hook 'python-mode-hook
          '(lambda ()
             (push '(?' . ?')
                   (getf autopair-extra-pairs :code))
             (setq autopair-handle-action-fns
                   (list #'autopair-default-handle-action
                         #'autopair-python-triple-quote-action))))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

(if (eq system-type 'gnu/linux)
    (progn
      (autoload 'pymacs-apply "pymacs")
      (autoload 'pymacs-call "pymacs")
      (autoload 'pymacs-eval "pymacs" nil t)
      (autoload 'pymacs-exec "pymacs" nil t)
      (autoload 'pymacs-load "pymacs" nil t)
      (autoload 'pymacs-autoload "pymacs")
      (require 'pycomplete)))

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

(require 'virtualenv)
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))


;(require 'pysmell)
;(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))
