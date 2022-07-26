{
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs-unstable, ... }: let
    importWithUnstable = module:
      { pkgs, ...}@args:
      import module
        (args // {
          unstable = (import nixpkgs-unstable {
            system = pkgs.system;
            config.allowUnfree = true;
          });
        });
  in {
    homeManagerModules = {
      emacs = {
        init = importWithUnstable ./home-manager/modules/emacs/init.nix;
        all-the-icons = importWithUnstable ./home-manager/modules/emacs/all-the-icons.nix;
      };
      exwm = importWithUnstable ./home-manager/modules/exwm.nix;
      firefox = importWithUnstable ./home-manager/modules/firefox.nix;
      git = importWithUnstable ./home-manager/modules/git.nix;
      gnome-terminal = importWithUnstable ./home-manager/modules/gnome-terminal.nix;
      keychain = importWithUnstable ./home-manager/modules/keychain.nix;
      notifications = importWithUnstable ./home-manager/modules/notifications.nix;
      proton-vpn = importWithUnstable ./home-manager/modules/proton-vpn.nix;
      starship = importWithUnstable ./home-manager/modules/starship.nix;
      tmux = importWithUnstable ./home-manager/modules/tmux.nix;
      xbanish = importWithUnstable ./home-manager/modules/xbanish.nix;
      zsh = importWithUnstable ./home-manager/modules/zsh.nix;
    };
    lib = {
      # elpaBuild requires either a file or tar, so tar up dir first
      elpaBuildDir = pkgs: epkgs: { packageRequires ? [], pname, src, version }:
        let
          versioned-name = "${pname}-${version}";
        in
          epkgs.elpaBuild ({ inherit packageRequires pname version; } // {
            src = pkgs.runCommand "${versioned-name}.tar" {} ''
              mkdir ${versioned-name}
              cp ${src}/*.el ./${versioned-name}
              tar cf $out ${versioned-name}
            '';
          });
    };
    nixosModules = {
      auto-upgrade = importWithUnstable ./nixos/modules/auto-upgrade.nix;
      avahi = importWithUnstable ./nixos/modules/avahi.nix;
      git = importWithUnstable ./nixos/modules/git.nix;
      nix = importWithUnstable ./nixos/modules/nix.nix;
      proton-vpn = importWithUnstable ./nixos/modules/proton-vpn.nix;
      root = importWithUnstable ./nixos/modules/root.nix;
      sudo = importWithUnstable ./nixos/modules/sudo.nix;
      tt-rss = importWithUnstable ./nixos/modules/tt-rss.nix;
      vaultwarden = importWithUnstable ./nixos/modules/vaultwarden.nix;
      zsh = importWithUnstable ./nixos/modules/zsh.nix;
    };
  };
}
