{ lib, nix-lib, pkgs, ... }: {
  home = {
    packages = [
      (pkgs.concatTextFile {
        name = "exwm";
        files = [ ../bin/exwm ];
        executable = true;
        destination = "/bin/exwm";
      })
      (pkgs.concatTextFile {
        name = "mic-mute";
        files = [ ../bin/mic-mute ];
        executable = true;
        destination = "/bin/mic-mute";
      })
      (pkgs.concatTextFile {
        name = "mic-status";
        files = [ ../bin/mic-status ];
        executable = true;
        destination = "/bin/mic-status";
      })
      (pkgs.concatTextFile {
        name = "mic-status-notify";
        files = [ ../bin/mic-status-notify ];
        executable = true;
        destination = "/bin/mic-status-notify";
      })
      (pkgs.concatTextFile {
        name = "mic-volume-lower";
        files = [ ../bin/mic-volume-lower ];
        executable = true;
        destination = "/bin/mic-volume-lower";
      })
      (pkgs.concatTextFile {
        name = "mic-volume-raise";
        files = [ ../bin/mic-volume-raise ];
        executable = true;
        destination = "/bin/mic-volume-raise";
      })
      (pkgs.concatTextFile {
        name = "speaker-mute";
        files = [ ../bin/speaker-mute ];
        executable = true;
        destination = "/bin/speaker-mute";
      })
      (pkgs.concatTextFile {
        name = "speaker-status";
        files = [ ../bin/speaker-status ];
        executable = true;
        destination = "/bin/speaker-status";
      })
      (pkgs.concatTextFile {
        name = "speaker-status-notify";
        files = [ ../bin/speaker-status-notify ];
        executable = true;
        destination = "/bin/speaker-status-notify";
      })
      (pkgs.concatTextFile {
        name = "speaker-volume-lower";
        files = [ ../bin/speaker-volume-lower ];
        executable = true;
        destination = "/bin/speaker-volume-lower";
      })
      (pkgs.concatTextFile {
        name = "speaker-volume-raise";
        files = [ ../bin/speaker-volume-raise ];
        executable = true;
        destination = "/bin/speaker-volume-raise";
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
        my-exwm = nix-lib.lib.elispBuild pkgs epkgs {
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
    initExtra = lib.mkAfter "[ ! -f $\{HOME}/.noexwm ] && (exwm; cinnamon-session-quit --no-prompt) &";
  };
}
