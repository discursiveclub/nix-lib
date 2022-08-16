{ lib, ... }: {
  services.ssmtp = with lib; {
    authPassFile = mkDefault "/var/lib/ssmtp/password";
    hostName = mkDefault "email-smtp.us-east-1.amazonaws.com:587";
    useTLS = mkDefault true;
    useSTARTTLS = mkDefault true;
  };
  users.groups.ssmtp = {};
}
