{hostname, ...}: {
  imports =
    if hostname == "nixos-desktop"
    then [
      ./desktop.nix

      ./modules/bluetooth.nix
      ./modules/boot.nix
      ./modules/gaming.nix
      ./modules/ia.nix
      ./modules/keyboard.nix
      ./modules/locales.nix
      ./modules/network.nix
      ./modules/openrgb.nix
      ./modules/pipewire.nix
      ./modules/printing.nix
      ./modules/plasma.nix
      ./modules/security.nix
      ./modules/system.nix
      ./modules/users.nix
    ]
    else if hostname == "nixos-laptop"
    then [
      ./laptop.nix

      ./modules/bluetooth.nix
      ./modules/boot.nix
      ./modules/keyboard-laptop.nix
      ./modules/locales.nix
      ./modules/network.nix
      ./modules/nextdns.nix
      ./modules/nvidia.nix
      ./modules/pipewire.nix
      ./modules/plasma.nix
      ./modules/printing.nix
      ./modules/swap.nix
      ./modules/system.nix
      ./modules/users.nix
    ]
    else [];
}