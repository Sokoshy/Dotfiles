{ config, pkgs, ... }:
{
  services.flatpak.enable = true;
  services.dbus.enable = true;
}
