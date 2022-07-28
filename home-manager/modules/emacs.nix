{ elispBuild, lib, ... }: {
  programs = {
    emacs = {
      enable = true;
      extraConfig = lib.mkBefore ''
        (load "~/.config/emacs/custom.el")
        (require 'use-package)
        (use-package magit)
        (use-package my
          :bind (("C-x b" . my-switch-buffer)
                 ("C-x C-b" . my-switch-buffer))
          :config (enable-theme 'my))
        (use-package nix-mode)
      '';
      extraPackages = epkgs: let
        my = elispBuild epkgs {
          pname = "my";
          version = "0.0.0";
          src = ../elisp/my;
          packageRequires = [];
        };
      in
        [ my ] ++
        (with epkgs; [
          magit
          nix-mode
          paredit
          use-package
        ]);
    };
  };
}
