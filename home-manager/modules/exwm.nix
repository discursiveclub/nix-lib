{ elispBuild, lib, pkgs, ... }: {
  home = {
    packages = [
      (pkgs.concatTextFile {
        name = "exwm";
        files = [ ../bin/exwm ];
        executable = true;
        destination = "/bin/exwm";
      })
      (pkgs.concatTextFile {
        name = "volume-up";
        files = [ ../bin/volume-up ];
        executable = true;
        destination = "/bin/volume-up";
      })
      (pkgs.concatTextFile {
        name = "volume-down";
        files = [ ../bin/volume-down ];
        executable = true;
        destination = "/bin/volume-down";
      })
      (pkgs.concatTextFile {
        name = "volume-mute";
        files = [ ../bin/volume-mute ];
        executable = true;
        destination = "/bin/volume-mute";
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
