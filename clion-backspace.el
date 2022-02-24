(defun clion-backspace ()
  (interactive)
  (if (or
       (> (current-column) (current-indentation))
       (use-region-p)
       current-prefix-arg)
      (call-interactively  #'c-electric-backspace)
    (if (bolp)
	(when (plb) (c-indent-line))
      (when (= (c-indent-line) 0) (plb)))))

(defun plb ()
  (if (save-excursion
	(forward-line -1)
	(looking-at-p "[[:space:]]*$"))
      (null (delete-region
	     (line-beginning-position 0)
	     (line-beginning-position)))
    (cl-letf* (((symbol-function 'fixup-whitespace)
		#'delete-horizontal-space))
	      (delete-indentation))))

(define-key c-mode-map (kbd "DEL") 'clion-backspace)

(provide 'clion-backspace)
