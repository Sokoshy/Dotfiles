{ pkgs, ...}:
{
  home.packages = with pkgs; [
      prismlauncher
      heroic
  ];
  programs.mangohud = {
      enable = true;
      package = pkgs.mangohud;
  };
}
