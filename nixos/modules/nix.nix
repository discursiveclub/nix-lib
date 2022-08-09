{ ... }: {
  nix = {
    autoOptimizeStore = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };
  nixpkgs.config.allowUnfree = true;
};
