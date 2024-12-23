{ hostname, ... }:
{
  imports =
    if hostname == "desktop" then
      [
        ./programs/archives.nix
        ./programs/aliases.nix
        ./programs/git.nix
        ./programs/zed-editor.nix
        ./programs/packages.nix
        ./programs/flatpak.nix
        ./programs/gaming.nix
        ./programs/helix.nix

        # ./system/tofi.nix
      ]
    # else if hostname == "laptop" then
    #   [
    #     ./programs/git.nix
    #     ./programs/zed.nix
    #     ./programs/archive.nix
    #     ./programs/packages.nix
    #   ]
    else
      [ ];
}
