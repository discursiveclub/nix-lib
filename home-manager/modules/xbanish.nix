{ pkgs, ... } : {
  home.packages = [ pkgs.xbanish ];
  systemd.user.services.xbanish = {
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Unit = {
      Description = "xbanish hides the mouse pointer while typing";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.xbanish}/bin/xbanish -m ne -i control -i mod4 -t 10";
      Restart = "always";
    };
  };
}
