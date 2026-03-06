{ config, lib, ... }:

let
  # Select the correct secret name based on the current machine's hostname.
  # Returns null if the hostname is not recognized, disabling the module entirely.
  hostname = config.networking.hostName;
  controld_stamp = if hostname == "nixos-desktop"
    then "controld_stamp_desktop"
    else if hostname == "nixos-laptop"
      then "controld_stamp_laptop"
      else null;
in
{
  # Declare the sops secrets for each machine.
  # The key refers to the path inside secrets.yaml (e.g. controld_stamp.desktop).
  # Both secrets are always declared so the file works on any host,
  # but only the relevant one will be used at runtime.
  sops.secrets."controld_stamp_desktop" = {
      key = "controld_stamp.desktop";
    };
  sops.secrets."controld_stamp_laptop" = {
      key = "controld_stamp.laptop";
    };

  # Generate a dnscrypt-proxy config file at runtime using sops-nix templates.
  # sops.placeholder injects the decrypted secret value into the file at activation time,
  # without ever writing the stamp to the Nix store.
  # mode 0444 is required because dnscrypt-proxy runs as a DynamicUser (ephemeral systemd user)
  # and needs read access without being in any specific group.
  sops.templates."dnscrypt-proxy.toml" = lib.mkIf (controld_stamp != null) {
    mode = "0444";
    content = ''
      server_names = ['controld']

      listen_addresses = ['127.0.0.1:53']

      [static]

      [static.controld]
      stamp = "${config.sops.placeholder.${controld_stamp}}"
    '';
  };

  # Enable dnscrypt-proxy and point it to the sops-rendered config file
  # instead of the NixOS-generated one, so the stamp is injected at runtime.
  services.dnscrypt-proxy = lib.mkIf (controld_stamp != null) {
      enable = true;
      configFile = config.sops.templates."dnscrypt-proxy.toml".path;
    };

  # systemd.services.dnscrypt-proxy = {
  #   unitConfig.ConditionPathExists =
  #     config.sops.templates."dnscrypt-proxy.toml".path;
  # };
}
