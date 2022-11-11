{ lib, nix-lib, pkgs, unstable, ... }: {
  home.file.".config/emacs/init.el".source = ./init.el;
  imports = [ ./my.nix ];
  programs = {
    emacs = {
      enable = true;
      extraPackages = epkgs: with epkgs; [
        magit
        nix-mode
        paredit
        use-package
      ];
    };
  };
}
