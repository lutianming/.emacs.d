;;; init-tex.el --- config auctex
;;; Commentary:
;;; Code:
;(require 'preview-latex)
(require 'auctex-autoloads)
(require 'preview)

;(TeX-PDF-mode t)
(setq-default TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-auto-untabify t)
(setq TeX-show-compilation t)
(setq TeX-parse-self t)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-engine-alist
      '(
	(pdflatex "pdflatex"
		  )
	(xetex "XeTeX shell escape"
	       "xetex --file-line-error --shell-escape"
	       "xelatex --file-line-error --shell-escape"
	       "xetex")))
(setq-default TeX-master nil)

(add-to-list 'TeX-command-list '("texi2dvi" "texi2dvi --shell-escape -p -b -V %t" TeX-run-command t t :help "Run texi2dvi -p") t)

;; (setq TeX-view-program-list
;;       '(("mupdf" "mupdf %o")))
;; (setq TeX-view-program-selection '((output-pdf "mupdf")))
(setq TeX-output-view-style (quote (("^pdf$" "." "mupdf %o") ("^html?$" "." "iceweasel %o"))))
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(provide 'init-tex)
;;; init-tex.el ends here
