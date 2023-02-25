IBM Carbon emacs themes (wip)
=============================

**Please note that these themes are still wip and need a little bit of polish**  


Install
-------

Clone this repo and cp the wanted theme into your .emacs.d directory  

```bash
$ git clone https://github.com/theBushek/ibm-carbon-emacs-themes
$ cd ibm-carbon-emacs-themes/src/
$ cp ibm-carbon-gray-100-theme.el ~/.emacs.d/
```

and use them with the doom-themes package:  

```elisp
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'ibm-carbon-gray-100 t)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  :custom
  (ibm-carbon-gray-100-warm t)
  (ibm-carbon-gray-100-line-number-colored t))
```


Configuration
-------------

All of the customizable variables can be accessed by the package helpful (C-h v in most cases)
