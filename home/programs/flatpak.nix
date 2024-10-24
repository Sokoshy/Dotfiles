{ pkgs, ... }:
{
  home.packages = with pkgs; [
    flatpak
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];

  programs.flatpak.enable = true;
}
