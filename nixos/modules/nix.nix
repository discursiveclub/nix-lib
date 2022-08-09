{ pkgs, ... }: {
  nix = {
    autoOptimizeStore = true;
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    package = pkgs.nixFlakes;
  };
  nixpkgs.config.allowUnfree = true;
};
