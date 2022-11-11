{ lib, nix-lib, pkgs, unstable, ... }: {
  programs = {
    emacs = {
      enable = true;
      extraPackages = epkgs: [
        (epkgs.elpaBuild {
          pname = "my";
          src = ./my.el;
          version = "0.0.0";
        })
      ];
    };
  };
}
