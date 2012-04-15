;;--------------------Latex--------------------
(require 'tex-site)

(setq TeX-auto-save t)
(setq TeX-auto-untabify t)
(setq TeX-show-compilation t)
(setq TeX-parse-self t)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-engine 'xetex)
(setq-default TeX-master nil)
(setq TeX-view-program-list
      '(("mupdf" "mupdf %o")
        ("evince" "evince %o")))
(setq TeX-view-program-selection '((output-pdf "mupdf")))

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'Tex-global-PDF-mode)
