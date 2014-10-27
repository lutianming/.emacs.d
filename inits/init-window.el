;;; init-window.el --- config window layout
;;; Commentary:
;;; Code:

(windmove-default-keybindings)

(winner-mode 1)
(global-set-key (kbd "C-x <left>") 'winner-undo)
(global-set-key (kbd "C-x <right>") 'winner-redo)

(window-numbering-mode 1)
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-x t") 'toggle-window-split)

(require 'popwin)
(popwin-mode 1)
;; (require 'ecb)
;; (setq ecb-layout-name "left6")
;; (setq ecb-tip-of-the-day nil)
;;(require 'sr-speedbar)
;;(semantic-mode)
;;(sr-speedbar-open)

(provide 'init-window)
;;; init-window.el ends here
