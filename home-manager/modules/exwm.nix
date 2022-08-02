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
        name = "speaker-up";
        files = [ ../bin/speaker-up ];
        executable = true;
        destination = "/bin/speaker-up";
      })
      (pkgs.concatTextFile {
        name = "speaker-down";
        files = [ ../bin/speaker-down ];
        executable = true;
        destination = "/bin/speaker-down";
      })
      (pkgs.concatTextFile {
        name = "speaker-mute";
        files = [ ../bin/speaker-mute ];
        executable = true;
        destination = "/bin/speaker-mute";
      })
      (pkgs.concatTextFile {
        name = "mic-up";
        files = [ ../bin/mic-up ];
        executable = true;
        destination = "/bin/mic-up";
      })
      (pkgs.concatTextFile {
        name = "mic-down";
        files = [ ../bin/mic-down ];
        executable = true;
        destination = "/bin/mic-down";
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
