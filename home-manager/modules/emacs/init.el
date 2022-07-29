;;; init.el --- Emacs initialization -*- lexical-binding: t; -*-
(load "~/.config/emacs/custom.el" t)
(require 'my)
(enable-theme 'my)

(require 'use-package)
(use-package magit
  :bind (("C-x g" . magit)))
(use-package my
  :bind (("C-x b" . my-switch-buffer)
         ("C-x C-b" . my-switch-buffer)))
(use-package nix-mode
  :defer t)
