{ config, pkgs, ... }:

{
  sops.secrets.nextdns-profile = {
    key = "nextdns.profile";
  };

  services.nextdns = {
    enable = true;
    arguments = [
      "-config"
      config.sops.secrets.nextdns-profile.path
    ];
  };
}
