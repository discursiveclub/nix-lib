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
        ] ++
      [ pkgs.flameshot ];
    sessionVariables = {
      EDITOR = "emacsclient";
    };
  };
  imports = [ ./emacs/my-exwm.nix ];
  xsession = {
    enable = true;
    initExtra = lib.mkAfter "[ ! -f $\{HOME}/.noexwm ] && (exwm; cinnamon-session-quit --no-prompt) &";
  };
}
