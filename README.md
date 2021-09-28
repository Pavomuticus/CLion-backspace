# CLion-backspace
Make emacs simulate CLion's backspace behavior

Bind this function to `DEL` to use
The easiest way is to add the following code in the `.emacs` file

```elisp
(eval-after-load "cc-mode"
  '(define-key c-mode-map (kbd "DEL") 'clion-backspace))
```
