{ pkgs, ...}:
{
  home.packages = with pkgs; [
      prismlauncher
      heroic
      goverlay
      mangohud
  ];
}