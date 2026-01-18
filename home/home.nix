{ hostname, username, ... }:
{
  imports =
    if hostname == "nixos-desktop" then
      [
        ./programs/archives.nix
        ./programs/gaming.nix
        ./programs/git.nix
        ./programs/packages.nix
        ./programs/vscode.nix
      ]
    else if hostname == "nixos-laptop" then
      [
        ./programs/archives.nix
        ./programs/git.nix
        ./programs/packages.nix
        ./programs/shell.nix
      ]
    else
      [ ];
  
  home = {
    username = "${username}";
      homeDirectory = "/home/${username}";
      stateVersion = "25.11";
  };
}