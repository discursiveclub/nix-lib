;;; init.el --- Emacs initialization -*- lexical-binding: t; -*-
(load "~/.config/emacs/custom.el" t)
(setq-default indent-tabs-mode nil)

;; Package configuration
(require 'use-package)
(use-package magit
  :bind (("C-c g" . magit-status)))
(use-package my
  :bind (("C-x b" . my-switch-buffer)
         ("C-x C-b" . my-switch-buffer)))
(use-package nix-mode)

(load "~/.config/emacs/init-local.el" t)
