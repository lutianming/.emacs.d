;;----------ibuffer----------
;;(autoload 'ibuffer "ibuffer" "List buffers." t)
(eval-after-load 'ibuffer
  '(require 'ibuffer-vc))

;; (setq ibuffer-saved-filter-groups
;;       (quote (("default"
;;                ("Programming" ;; prog stuff not already in MyProjectX
;;                 (or
;;                  (mode . c-mode)
;;                  (mode . c++-mode)
;;                  (mode . python-mode)
;;                  (mode . emacs-lisp-mode)
;;                  (mode . lisp-mode)
;;                  (mode . sql-mode)
;;                  (mode . html-mode)
;;                  (mode . js2-mode)
;;                  (mode . pascal-mode)
;;                  (mode . makefile-gmake-mode)
;;                  (mode . nxml-mode)
;;                  (mode . yaml-mode)
;;                  (mode . sh-mode)
;;                  (mode . rst-mode)
;;                  (mode . go-mode)
;;                  (mode . po-mode)
;;                  (mode . css-mode)
;;                  ;; etc
;;                  ))
;;                ("Dired"
;;                 (or
;;                  (mode . dired-mode)))
;;                ("Version Control"
;;                 (or
;;                  (mode . magit-mode)
;;                  (name . "^*magit")
;;                  (mode . ahg-status-mode)))
;;                ("Org" ;; all org-related buffers
;;                 (or
;;                  (mode . org-mode)
;;                  (mode . org-agenda-mode)
;;                  (mode . diary-mode)
;;                  (mode . calendar-mode)
;;                  (name . "^*Fancy Diary")
;;                  ))
;;                ("Emacs"
;;                 (or
;;                  (name . "^\\*scratch\\*$")
;;                  (name . "^\\*Messages\\*$")
;;                  (name . "^\\*ielm\\*$")
;;                  (name . "^\\*Packages\\*$")
;;                  (mode . help-mode)))
;;                ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'init-ibuffer)
