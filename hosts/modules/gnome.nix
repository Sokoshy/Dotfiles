{ config, pkgs, ... }:

{
    # services.xserver = {
    #     enable = true;
    #     displayManager.gdm.enable   = true;
    #     desktopManager.gnome.enable = true;
    # };
    # services.xdg.portal = {
    #     enable = true;
    #     extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    #   };
    # }
    services = {
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      };
    };

    environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnome-tweaks
    gnomeExtensions.appindicator
    ];
    environment.gnome.excludePackages = with pkgs; [
        gnome-weather  gnome-music
        totem tali iagno hitori atomix
        yelp gnome-maps gnome-clocks gnome-connections
        geary xterm gnome-user-docs gnome-calculator cheese epiphany
        gnome-packagekit packagekit gnome-tour
        #gnome.geary # email reader. Up to 24.05. Starting from 24.11 the package name is just geary.
  ];
}
