{hostname, ...}: {
  imports =
    if hostname == "desktop"
    then [
      ./desktop.nix

      ./modules/bluetooth.nix
      ./modules/boot.nix
      ./modules/cachyosEntrie.nix
      ./modules/flatpak.nix
      ./modules/gnome.nix
      ./modules/gaming.nix
      ./modules/keyboard.nix
      ./modules/locales.nix
      ./modules/network.nix
      ./modules/nh.nix
      ./modules/pipewire.nix
      ./modules/printing.nix
      ./modules/security.nix
      ./modules/system.nix
      ./modules/users.nix
    ]
    #else if hostname == "laptop"
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
