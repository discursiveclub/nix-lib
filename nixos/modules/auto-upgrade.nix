{ lib, ... }: {
  # generate a deploy key:
  #  sudo ssh-keygen -t ed25519 -f /etc/nixos/deploy-key -N "" -C "`hostname` deploy key"
  # then add the public key as a deploy key on the appropriate github repository
  programs.ssh.extraConfig = ''
    Host deploy.github.com
      Hostname github.com
      IdentityFile "/etc/nixos/deploy-key"
  '';
  system.autoUpgrade = {
    allowReboot = lib.mkDefault true;
    enable = true;
    flags = [
      # must be set in system config
      # "--update-input" "nixpkgs"
      "--no-write-lock-file"
    ];
    # must be set in system config
    # flake = "git+ssh://git@deploy.github.com/example/example?ref=example";
  };
}
