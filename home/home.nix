{ hostname, username, ... }:
{
  imports =
    if hostname == "nix-desktop" then
      [
        ./programs/archives.nix
        ./programs/gaming.nix
        ./programs/git.nix
        ./programs/packages.nix
        ./programs/vscode.nix
        # ./system/tofi.nix
      ]
    # else if hostname == "nix-laptop" then
    #   [
    #     ./programs/git.nix
    #     ./programs/zed.nix
    #     ./programs/archive.nix
    #     ./programs/packages.nix
    #   ]
    else
      [ ];
  
  home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "24.11";
    };
  programs.home-manager.enable = true;
}