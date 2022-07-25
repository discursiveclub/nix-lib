{ unstable, ... }: {
  # 22.05 complains about not finding dbus
  home.packages = with unstable; [ protonvpn-cli protonvpn-gui ];
}
