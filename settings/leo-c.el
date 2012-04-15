;;----------CEDET-------------------------------------------------
(load-file "~/.emacs.d/plugins/cedet-1.1beta2/common/cedet.el")
(global-srecode-minor-mode 1)
(global-ede-mode 1)
(semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
(require 'semantic-ia)
(require 'semantic-gcc)
(require 'cc-mode)
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu) ;;补全

;;h/cpp切换
(require 'eassist nil 'noerror)
(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)

;;代码折叠
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)

;;代码生成
(global-srecode-minor-mode 1)
;;;; Custom template for srecode
(setq srecode-map-load-path
  (list (srecode-map-base-template-dir)
    (expand-file-name "~/.emacs.d/el-get/cedet/srecode")
    ))

;;----------ECB-------------------------------------------------
;(require 'ecb)
;(ecb-minor-mode)
;(setq ecb-tip-of-the-day nil)
