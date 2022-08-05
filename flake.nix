{
  outputs = { self, ... }: {
    homeManagerModules = {
      emacs = {
        init = import ./home-manager/modules/emacs/init.nix;
        all-the-icons = import ./home-manager/modules/emacs/all-the-icons.nix;
      };
      exwm = import ./home-manager/modules/exwm.nix;
      firefox = import ./home-manager/modules/firefox.nix;
      git = import ./home-manager/modules/git.nix;
      gnome-terminal = import ./home-manager/modules/gnome-terminal.nix;
      keychain = import ./home-manager/modules/keychain.nix;
      notifications = import ./home-manager/modules/notifications.nix;
      proton-vpn = import ./home-manager/modules/proton-vpn.nix;
      tmux = import ./home-manager/modules/tmux.nix;
      xbanish = import ./home-manager/modules/xbanish.nix;
      zsh = import ./home-manager/modules/zsh.nix;
    };
    lib = let
      elispBuild = pkgs: epkgs: { packageRequires, pname, src, version }: let
        versioned-name = "${pname}-${version}";
      in
        epkgs.elpaBuild ({ inherit packageRequires pname version; } // {
          src = pkgs.runCommand "${versioned-name}.tar" {} ''
            mkdir ${versioned-name}
            cp ${src}/*.el ./${versioned-name}
            tar cf $out ${versioned-name}
          '';
        });
    in {
      inherit elispBuild;
    };
    nixosModules = {
      git = import ./nixos/modules/git.nix;
      proton-vpn = import ./nixos/modules/proton-vpn.nix;
      sudo = import ./nixos/modules/sudo.nix;
      zsh = import ./nixos/modules/zsh.nix;
    };
  };
}
