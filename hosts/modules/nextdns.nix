{ config, pkgs, lib, ... }:

{
  sops.secrets."nextdns.profile.laptop" = {};

  environment.systemPackages = with pkgs; [
    nextdns
  ];
  
  services.nextdns = {
    enable = true;

    arguments = [
      "-profile"
      "${config.sops.secrets."nextdns.profile.laptop".path}"
    ];
  };
}
