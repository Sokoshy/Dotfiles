{hostname, ...}: {
  imports =
    if hostname == "nix-desktop"
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
    #else if hostname == "nix-laptop"
    #then [
      #./laptop.nix

      #./modules/boot.nix
      #./modules/users.nix
      #./modules/system.nix
      #./modules/network.nix
      #./modules/lanzaboot.nix
    #]
    else [];
}
