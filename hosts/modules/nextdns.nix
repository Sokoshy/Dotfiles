{ config, pkgs, lib, ... }:

{
  sops.secrets."nextdns.profile.laptop" = {};

  sops.templates."nextdns.conf".content = ''
    profile ${config.sops.placeholder."nextdns.profile.laptop"}
  '';

  environment.systemPackages = with pkgs; [
    nextdns
  ];
  
  services.nextdns = {
    enable = true;

    arguments = [
      "-config-file"
      config.sops.templates."nextdns.conf".path
    ];
  };
}
