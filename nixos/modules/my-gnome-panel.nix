{ pkgs, ... }: let
  gnome-applets = pkgs.gnome.gnome-applets;
  gnome-flashback = pkgs.gnome.gnome-flashback;
  gnome-panel = pkgs.gnome.gnome-panel;
  modulesEnv = pkgs.buildEnv {
    name = "my-gnome-panel-modules-env";
    paths = [ gnome-applets gnome-flashback gnome-panel ];
    pathsToLink = [ "/lib/gnome-panel/modules" ];
  };
in
  {
    environment = {
      systemPackages = [
        gnome-applets
        gnome-flashback
        gnome-panel
        (pkgs.writeShellScriptBin "my-gnome-panel"
          ''
            NIX_GNOME_PANEL_MODULESDIR=${modulesEnv}/lib/gnome-panel/modules \
            ${gnome-panel}/bin/gnome-panel -r
          '')
      ];
    };
    services.xserver.desktopManager.cinnamon.extraGSettingsOverridePackages = [
      gnome-applets
      gnome-flashback
      gnome-panel
    ];
  }
