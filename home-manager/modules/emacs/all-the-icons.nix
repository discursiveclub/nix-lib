{ lib, pkgs, unstable, ... }: {
  home.packages = with pkgs; [ emacs-all-the-icons-fonts ];
  programs = {
    emacs = {
      enable = true;
      extraConfig = builtins.readFile ./all-the-icons.el;
      extraPackages = epkgs: with epkgs; [
        all-the-icons
        all-the-icons-completion
        all-the-icons-ibuffer
        # an abandoned and resurrected project; the alignment is off on the
        # release version, but better on unstable
        unstable.emacs28Packages.all-the-icons-dired
      ];
    };
  };
}
