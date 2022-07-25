{ pkgs, ... } : {
  security.sudo = {
    execWheelOnly = true;
    extraConfig = "Defaults timestamp_type=global,timestamp_timeout=-1";
  };
  # Need to be able to test this; should do something similar for
  # keychain
  #
  # systemd.user.services.sudo-reset = {
  #   description = "reset sudo authentication after sleeping";
  #   wantedBy = [ "post-resume.target" ];
  #   partOf = [ "post-resume.target" ];
  #   serviceConfig.ExecStart = ''
  #     ${pkgs.sudo}/bin/sudo -k
  #   '';
  # };
}
