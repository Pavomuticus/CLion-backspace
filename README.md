# CLion-backspace
Make emacs simulate CLion's backspace behavior

The easiest way is to add the following code in the `.emacs` file

```elisp
(eval-after-load 'cc-mode '(require 'clion-backspace))
```
