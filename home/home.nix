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
