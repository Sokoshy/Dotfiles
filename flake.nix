{
  description = "NixOS configuration of Sokoshy";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-stable, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
        nix-desktop = let
        username = "sokoshy";
        hostname = "nix-desktop";
        system = "x86_64-linux";
        stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        # specialArgs = {
        #     inherit inputs username hostname;
        # }
        in 
          nixpkgs.lib.nixosSystem {
            # inherit specialArgs;
            system = system;
            specialArgs = {
                inherit inputs username hostname stable;
            };

            modules = [
                ./hosts/default.nix

                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;

                  home-manager.extraSpecialArgs = {
                    inherit inputs username hostname stable;
                  };

                  home-manager.users.${username} = import ./home/home.nix;
                }
            ];
        };
    };
  };
}