{ ... }: {
  programs.git = {
    enable = true;
    ignores = [ "*~" ];
  };
}
