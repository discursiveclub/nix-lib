{ pkgs, ... }:
let
  version = "1.0.0";
  xbacklight = "${pkgs.acpilight}/bin/xbacklight";
  brightness-status = (pkgs.writers.writeBashBin "brightness-status" ''
    echo " $(${xbacklight} -get)%"
  '');
  status = "${brightness-status}/bin/brightness-status";
  brightness-status-notify = pkgs.writers.writeBashBin "brightness-status-notify" ''
    ${pkgs.notify-desktop}/bin/notify-desktop -t 1000 -r 6727248298 "$(${status})"
  '';
  notify = "${brightness-status-notify}/bin/brightness-status-notify";
in
pkgs.symlinkJoin {
  name = "brightnessctl";
  paths = [
    brightness-status
    brightness-status-notify
    (pkgs.writers.writeBashBin "brightness-down" ''
      ${xbacklight} -dec 10
      ${notify}
    '')
    (pkgs.writers.writeBashBin "brightness-up" ''
      ${xbacklight} -inc 10
      ${notify}
    '')
  ];
}
