{ config, pkgs, ... }: {

services.postfix = {
    mapFiles."sasl_passwd" = builtins.toFile "sasl_passwd" "mail.<Domain> <Email address>:<Password>";
    relayPort = 465;
    extraMasterConf = ''postlog   unix-dgram n  -       n       -       1       postlogd'';
    extraConfig =
    ''
      maillog_file = /var/log/postfix.log
      smtp_sasl_auth_enable = yes
      smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
      smtp_sasl_security_options = noanonymous
      smtp_sasl_tls_security_options = noanonymous
      smtp_sasl_mechanism_filter = AUTH LOGIN
    '';
  };
}