{
  description = "NixOS configuration of Sokoshy";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
        nix-desktop = let
        username = "sokoshy";
        hostname = "nix-desktop";
        # specialArgs = {
        #     inherit inputs username hostname;
        # }
        in 
          nixpkgs.lib.nixosSystem {
            # inherit specialArgs;
            system = "x86_64-linux";
            specialArgs = {
                inherit inputs username hostname;
            };

            modules = [
                ./hosts/default.nix

                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;

                  home-manager.extraSpecialArgs = {
                    inherit inputs username hostname;
                  };

                  home-manager.users.${username} = import ./home/home.nix;
                }
            ];
        };
    };
  };
}