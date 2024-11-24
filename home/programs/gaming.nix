{ pkgs, ...}:
{
  home.packages = with pkgs; [
      prismlauncher
      heroic
  ];
  programs.mangohud = {
      enable = true;
      package = with pkgs; [ mangohud ];
  };
}
