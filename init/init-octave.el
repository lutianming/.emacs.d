;;--------------------Octave-mode ---------------------------------------------
;; autolad octave mode for *.m-files
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
;; to turn on the abbrevs, auto-fill and font-lock features automatically
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))
;; And finally, inferior-octave-mode-hook is run after starting the process
;; and putting its buffer into Inferior Octave mode. Hence, if you like
;; the up and down arrow keys to behave in the interaction buffer as in
;; the shell, and you want this buffer to use nice colors:

(add-hook 'inferior-octave-mode-hook
	  (lambda ()
	    (turn-on-font-lock)
	    (define-key inferior-octave-mode-map [up]
	      'comint-previous-input)
	    (define-key inferior-octave-mode-map [down]
	      'comint-next-input)))
;; RET adds a newline and indents it

;; run an inferior Octave process in a special Emacs buffer
(autoload 'run-octave "octave-inf" nil t)
