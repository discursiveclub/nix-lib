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
        name = "speaker-raise";
        files = [ ../bin/speaker-raise ];
        executable = true;
        destination = "/bin/speaker-raise";
      })
      (pkgs.concatTextFile {
        name = "speaker-lower";
        files = [ ../bin/speaker-lower ];
        executable = true;
        destination = "/bin/speaker-lower";
      })
      (pkgs.concatTextFile {
        name = "speaker-mute";
        files = [ ../bin/speaker-mute ];
        executable = true;
        destination = "/bin/speaker-mute";
      })
      (pkgs.concatTextFile {
        name = "mic-raise";
        files = [ ../bin/mic-raise ];
        executable = true;
        destination = "/bin/mic-raise";
      })
      (pkgs.concatTextFile {
        name = "mic-lower";
        files = [ ../bin/mic-lower ];
        executable = true;
        destination = "/bin/mic-lower";
      })
      (pkgs.concatTextFile {
        name = "mic-mute";
        files = [ ../bin/mic-mute ];
        executable = true;
        destination = "/bin/mic-mute";
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
