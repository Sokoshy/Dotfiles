{ hostname, ... }:
{
  imports =
    if hostname == "desktop" then
      [
        ./programs/git.nix
        ./programs/zed-editor.nix
        ./programs/archives.nix
        ./programs/packages.nix
        ./programs/flatpak.nix
        ./programs/firefox.nix
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
