{ config, pkgs, username, ... }:

{
  ## Path to encrypted secrets files
  sops.defaultSopsFile = ../../secrets/secrets.yaml;

  ## Format file
  sops.defaultSopsFormat = "yaml";

  ## Configuration Age (clé locale)
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

  ## S’assurer que sops est dispo
  environment.systemPackages = [
    pkgs.sops
    pkgs.age
  ];
}