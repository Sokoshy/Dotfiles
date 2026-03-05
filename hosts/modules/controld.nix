{ config, lib, ... }:

let
  hostname = config.networking.hostName;
  controld_stamp = if hostname == "nixos-desktop"
    then config.sops.secrets.controld_stamp.desktop
    else if hostname == "nixos-laptop"
      then config.sops.secrets.controld_stamp.laptop
      else null;
in
{
  # Déclarer les secrets
  sops.secrets.controld_stamp.desktop = { };
  sops.secrets.controld_stamp.laptop = { };

  # Configurer dnscrypt-proxy2 dynamiquement selon le hostname
  services.dnscrypt-proxy2 = lib.mkIf (controld_stamp != null) {
    enable = true;
    settings = {
      server_names = [ "controld" ];
      static = {
        controld = {
          stamp = builtins.readFile controld_stamp;
        };
      };
      listen_addresses = [ "127.0.0.1:53" ];
    };
  };
}
