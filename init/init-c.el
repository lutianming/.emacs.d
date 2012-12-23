;;----------CEDET-------------------------------------------------
(load-file "~/.emacs.d/plugins/cedet/cedet-devel-load.el")
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(semantic-mode 1)
(require 'semantic/ia)
(require 'semantic/bovine/gcc)

(require 'ascope)
(require 'xcscope)
