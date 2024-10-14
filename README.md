# NixOS-SMTPRelay

## This repository contains `.nix` files to set up a `SMTP-Relay` using `Postfix` on the server-side as add-on to the `NixOS-Mailserver` and `msmtp` as `SMTP client`.

You can use this to route emails through your email server from a client without a static public IP address to avoid blacklisting or to not set up an entire email server within your application. 

- Clone this repo with `git clone https://github.com/DieSchoeneWolke/NixOS-SMTPRelay.git` on your client.

- Write your credentials with `sudo mkdir -p /etc/.secrets/ && sudo nano /etc/.secrets/smtp_password.txt` to be used by `msmtp`.

- Write your credentials and domain in the `relay.nix` file with `nano ./NixOS-STMPRelay/relay.nix` to be used by `Postfix` at the `NixOS-Mailserver`.

- Transfer the file to your `NixOS-Mailserver` server at `/etc/nixos/relay.nix` and append it to your `configuration.nix` with `sudo nano /etc/nixos/configuration.nix`

```
{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./relay.nix
  ];
```

- Build a new generation with `sudo nixos-rebuild switch` on both machines.

- Send a test email with `echo -e "Content-Type: text/plain\r\nSubject: Test\r\n\r\nHello World" | sudo sendmail <Email address>` from your client.

## ⚠ This is not a best practice solution. You should secure the credentials using `sops-nix` or any other secret management solution.
