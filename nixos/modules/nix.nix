{ pkgs, ... }: {
  nix = {
    extraOptions = "experimental-features = nix-command flakes";
    gc = {
      automatic = true;
      dates = "03:15";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = [ "04:15" ];
    };
    package = pkgs.nixFlakes;
    settings.auto-optimise-store = true;
  };
  nixpkgs.config.allowUnfree = true;
}
