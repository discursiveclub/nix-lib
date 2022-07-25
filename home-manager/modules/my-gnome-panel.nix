{ elispBuild, ... }:
{
  dconf.settings = {
    "org/gnome/gnome-panel/layout" = {
      object-id-list = [ "clock" "notification-area" ];
      toplevel-id-list = [ "top-panel" ];
    };
    "org/gnome/gnome-panel/layout/toplevels/toplevel" = {
      alignment = "center";
      animation-speed = "fast";
      auto-hide = false;
      auto-hide-size = 1;
      enable-buttons = false;
      expand = true;
      hide-delay = 300;
      monitor = 0;
      orientation = "top";
      size = 24;
      unhide-delay = 100;
    };
    "org/gnome/gnome-panel/layout/objects/clock" = {
      object-iid = "org.gnome.gnome-panel.clock::clock";
      pack-index = 0;
      pack-type = "center";
      toplevel-id = "top-panel";
    };
    "org/gnome/gnome-panel/layout/objects/notification-area" = {
      object-iid = "org.gnome.gnome-panel.notification-area::notification-area";
      pack-index = 0;
      pack-type = "end";
      toplevel-id = "top-panel";
    };
  };
  programs = {
    emacs = {
      enable = true;
      extraConfig = "(require 'my-gnome-panel)";
      extraPackages = epkgs: let
        my-gnome-panel = elispBuild epkgs {
          pname = "my-gnome-panel";
          version = "0.0.0";
          src = ../elisp/my-gnome-panel;
          packageRequires = with epkgs; [
            exwm
          ];
        };
      in
        [ my-gnome-panel ];
    };
  };
}
