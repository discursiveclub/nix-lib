{
  inputs.unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, unstable, ... }: let
    importHmModule = module: { pkgs, ... }@args: let
      elispBuild = epkgs: { packageRequires, pname, src, version }: let
        versioned-name = "${pname}-${version}";
      in
        epkgs.elpaBuild ({ inherit packageRequires pname version; } // {
          src = pkgs.runCommand "${versioned-name}.tar" {} ''
            mkdir ${versioned-name}
            cp ${src}/*.el ./${versioned-name}
            tar cf $out ${versioned-name}
          '';
        });
    in
      import module (args // {
        inherit elispBuild;
        unstable = unstable.legacyPackages."x86_64-linux";
      });
  in {
    homeManagerModules = {
      emacs = {
        init = importHmModule ./home-manager/modules/emacs/init.nix;
        all-the-icons = importHmModule ./home-manager/modules/emacs/all-the-icons.nix;
      };
      exwm = importHmModule ./home-manager/modules/exwm.nix;
      firefox = importHmModule ./home-manager/modules/firefox.nix;
      git = importHmModule ./home-manager/modules/git.nix;
      gnome-terminal = importHmModule ./home-manager/modules/gnome-terminal.nix;
      keychain = importHmModule ./home-manager/modules/keychain.nix;
      my-gnome-panel = importHmModule ./home-manager/modules/my-gnome-panel.nix;
      proton-vpn = importHmModule ./home-manager/modules/proton-vpn.nix;
      tmux = importHmModule ./home-manager/modules/tmux.nix;
      xbanish = importHmModule ./home-manager/modules/xbanish.nix;
      zsh = importHmModule ./home-manager/modules/zsh.nix;
    };
    lib = {
      importHmConfig = { module, extraArgs }:
        { pkgs, ... }@args:
        import module (args // extraArgs);
    };
    nixosModules = {
      git = import ./nixos/modules/git.nix;
      my-gnome-panel = import ./nixos/modules/my-gnome-panel.nix;
      proton-vpn = import ./nixos/modules/proton-vpn.nix;
      sudo = import ./nixos/modules/sudo.nix;
      zsh = import ./nixos/modules/zsh.nix;
    };
  };
}
