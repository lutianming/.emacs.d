(require 'python)
(require 'flymake)

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

(require 'jedi)
(setq jedi:key-goto-definition (kbd "C-c ["))
(setq jedi:key-goto-definition-pop-marker (kbd "C-c ]"))
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot 1)
(add-hook 'python-mode-hook 'jedi:setup)

(require 'virtualenv)

(provide 'init-python)
