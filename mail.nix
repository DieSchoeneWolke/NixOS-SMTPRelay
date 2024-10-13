{ config, pkgs, ... }: {

programs.msmtp = {
  enable = true;
  accounts = {
    default = {
      auth = true;
      tls = true;
      tls_starttls = false;
      port = 465;
      from = "<Email address>";
      host = "<Domain>";
      user = "<Email address>";
      passwordeval = "cat /secrets/smtp_password.txt";
      };
    };
  };
}