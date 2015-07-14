;;; init-python.el --- python config
;;; Commentary:
;;; Code:

(require 'python)
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; (require 'elpy)
;; (elpy-enable)
;; (elpy-clean-modeline)
;; (elpy-use-ipython)
;; (setq elpy-rpc-backend "jedi")

(require 'jedi)
(setq jedi:key-goto-definition (kbd "C-c ["))
(setq jedi:key-goto-definition-pop-marker (kbd "C-c ]"))
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot 1)
(add-hook 'python-mode-hook 'jedi:setup)

(add-to-list 'company-backends 'company-jedi)

(require 'virtualenv)

;; (require 'ein)
;; (setq ein:use-auto-complete t)

(provide 'init-python)
;;; init-python.el ends here
