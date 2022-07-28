{ elispBuild, lib, ... }: {
  home.file.".config/emacs/init.el".source = ../elisp/init.el;
  programs = {
    emacs = {
      enable = true;
      extraConfig = builtins.readFile ./emacs.el;
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
