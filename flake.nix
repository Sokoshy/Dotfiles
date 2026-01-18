{
  description = "y Nix Dotfiles";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    #home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #zen-browser
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... } @inputs: {
    nixosConfigurations = {
        nixos-laptop = let
        username = "sokoshy";
        hostname = "nixos-laptop";
      system = "x86_64-linux";
        stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        in 
          nixpkgs.lib.nixosSystem {
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
        nixos-desktop = let
        username = "sokoshy";
        hostname = "nixos-desktop";
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