{ lib, nix-lib, pkgs, ... }: {
  home = {
    packages =
      map (f: pkgs.concatTextFile {
        name = f;
        files = [ (../bin + "/${f}") ];
        executable = true;
        destination = "/bin/${f}";
      })
        [
          "brightness-down"
          "brightness-status"
          "brightness-status-notify"
          "brightness-up"
          "exwm"
          "mic-mute"
          "mic-status"
          "mic-status-notify"
          "mic-volume-lower"
          "mic-volume-raise"
          "speaker-mute"
          "speaker-status"
          "speaker-status-notify"
          "speaker-volume-lower"
          "speaker-volume-raise"
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
