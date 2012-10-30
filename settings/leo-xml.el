(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'sgml-xml-mode) t)))
(setq nxml-child-indent 2)
