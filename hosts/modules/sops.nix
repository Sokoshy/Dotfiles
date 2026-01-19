{ config, pkgs, username, ... }:

{
  # Path to encrypted secrets files
  sops.defaultSopsFile = "/home/${username}/Dotfiles/secrets/secrets.yaml";

  # Format file
  sops.defaultSopsFormat = "yaml";

  # Age Configuration (local key)
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

  # Allows the use of a file from outside the Nix store
  sops.validateSopsFiles = false;

  # Make sure that sops is available in the system
  environment.systemPackages = [
    pkgs.sops
    pkgs.age
  ];
}