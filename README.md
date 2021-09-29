# CLion-backspace
Make emacs simulate CLion's backspace behavior

The easiest way is to add the following code in the `.emacs` file

```elisp
(with-eval-after-load "cc-mode"
  (require 'clion-backspace)
  (define-key c-mode-map (kbd "DEL") 'clion-backspace))
```
