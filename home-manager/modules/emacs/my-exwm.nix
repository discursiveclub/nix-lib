{ lib, nix-lib, pkgs, unstable, ... }: {
  imports = [ ./init.nix  ];
  programs = {
    emacs = {
      enable = true;
      extraPackages = epkgs: [
        (epkgs.elpaBuild {
          packageRequires = with epkgs; [
            exwm
            exwm-mff
            exwm-modeline
          ];
          pname = "my-exwm";
          src = ./my-exwm.el;
          version = "0.0.0";
        })
      ];
    };
  };
}
