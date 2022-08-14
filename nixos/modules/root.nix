{ ... }: {
  services.openssh.permitRootLogin = "prohibit-password";
  users.users.root = {
    password = null;
  };
}
