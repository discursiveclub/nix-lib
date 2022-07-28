(require 'use-package)
(use-package magit)
(use-package my
  :bind (("C-x b" . my-switch-buffer)
         ("C-x C-b" . my-switch-buffer)))
(use-package nix-mode)
