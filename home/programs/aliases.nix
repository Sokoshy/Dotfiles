{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      # Alias pour lancer JetBrains IDEA
      alias idea='${pkgs.jetbrains.idea-ultimate}/bin/idea-ultimate'
    '';
  };
}
