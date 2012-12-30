(setq default-major-mode 'text-mode);一打开就起用 text 模式。
(setq global-font-lock-mode t);语法高亮
(setq auto-image-file-mode t);打开图片显示功能
(setq column-number-mode t);显示列号
(setq line-number-mode t) ;显示列号
(setq show-paren-mode t);显示括号匹配
(setq mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开
(setq mouse-yank-at-point t);支持中键粘贴
(setq transient-mark-mode t);高亮选中
(setq delete-selection-mode t)
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
(setq frame-title-format "leo.emacs@%b")
(setq user-full-name "Lu Tianming")
(setq user-mail-address "lutianming1005@gmail.com")
(setq default-fill-column 80);默认显示 80列就换行

(setq inhibit-startup-message t) ;关闭开机画面
(setq inhibit-startup-echo-area-message t)

(setq global-linum-mode t)
(setq shell-cd-regexp nil) ;保持默认目录不改变
(setq shell-push-regexp nil)
(setq shell-popd-regexp nil)
;;页面平滑滚动
(setq scroll-margin 5
      scroll-conservatively 10000)


;; Auto refresh buffers
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;;----------flyspell----------
(setq ispell-program-name "aspell")
(ispell-change-dictionary "american" t)

(setq
 backup-by-copying-when-linked t
 delete-old-versions t
 kept-new-versions 3
 kept-old-versions 2
 version-control t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'before-make-frame-hook
          #'(lambda ()
              (add-to-list 'default-frame-alist '(left . 0))
              (add-to-list 'default-frame-alist '(top . 0 ))
              (add-to-list 'default-frame-alist '(height . 40))
              (add-to-list 'default-frame-alist '(width . 90))))

(provide 'init-setup)
