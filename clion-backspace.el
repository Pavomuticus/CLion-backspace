(defun clion-backspace (arg)
  "Simulate clion's backspace key behavior"
  (interactive "*P")
  (if (and (<= (current-column) (current-indentation)) (not (use-region-p)))
      (if (= (current-indentation) (c-get-syntactic-indentation (c-guess-basic-syntax)))
	  (if (previous-line-blank-p)
	      (progn (delete-region (line-beginning-position 0) (line-beginning-position)) (back-to-indentation))
	    (delete-indentation))
	(if (bolp)
	    (if (previous-line-blank-p)
		(progn (delete-indentation) (c-indent-line))
	      (delete-indentation))
	  (c-indent-line)))
    (c-electric-backspace arg)))

(defun previous-line-blank-p ()
  (save-excursion
    (previous-line)
    (beginning-of-line)
    (looking-at "[[:space:]]*$")))

(define-key c-mode-map (kbd "DEL") 'clion-backspace)

(provide 'clion-backspace)
