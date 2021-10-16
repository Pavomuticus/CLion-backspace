(defun clion-backspace (arg)
  (interactive "*P")
  (if (and
       (<= (current-column) (current-indentation))
       (not (use-region-p)))
      (if (bolp)
	  (progn (c-indent-line) (plb))
	(when (= (c-indent-line) 0) (plb)))
    (c-electric-backspace arg)))

(defun plb ()
  (if (save-excursion
	(forward-line -1)
	(looking-at "[[:space:]]*$"))
      (delete-region
       (line-beginning-position 0)
       (line-beginning-position))
    (cl-letf* (((symbol-function 'fixup-whitespace) #'delete-horizontal-space))
	      (delete-indentation))))

(define-key c-mode-map (kbd "DEL") 'clion-backspace)

(provide 'clion-backspace)
