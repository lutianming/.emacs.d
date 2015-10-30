;;; init-packages.el --- packages config
;;; Commentary:
;;; Code:

;;(require 'package)
;; (add-to-list 'package-archives
;;              '("gnu" . "http://elpa.gnu.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/") t)
;; (package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(provide 'init-packages)
;;; init-packages.el ends here
