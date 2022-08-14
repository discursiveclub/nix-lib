{ authUser, domain, enable, root }:
{ ... } : {
  services.ssmtp = {
    authUser = authUser;
    authPassFile = "/var/lib/ssmtp/password";
    domain = domain;
    enable = enable;
    hostName = "email-smtp.us-east-1.amazonaws.com:587";
    root = root;
    useTLS = true;
    useSTARTTLS = true;
  };
  users.groups.ssmtp = {};
}
