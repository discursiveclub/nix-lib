{ elispBuild, lib, pkgs, ... }: {
  home = {
    file.".config/emacs/init.el".source = ../elisp/init.el;
    packages = [
      (pkgs.concatTextFile {
        name = "exwm";
        files = [ ../bin/exwm ];
        executable = true;
        destination = "/bin/exwm";
      })
    ];
    sessionVariables = {
      EDITOR = "emacsclient";
    };
  };
  programs = {
    emacs = {
      enable = true;
      extraPackages = epkgs: let
        my-exwm = elispBuild epkgs {
          pname = "my-exwm";
          version = "0.0.0";
          src = ../elisp/my-exwm;
          packageRequires = with epkgs; [
            exwm
            exwm-mff
            exwm-modeline
          ];
        };
      in
        [ my-exwm ];
    };
  };
  xsession = {
    enable = true;
    initExtra = lib.mkAfter "(exwm; cinnamon-session-quit --no-prompt) &";
  };
}
