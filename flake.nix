{
description = "My NixOS flake";

    inputs = {
        # NixOS official package source, using the nixos branch here
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";

            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {nixpkgs, ...} @ inputs: {
        nixosConfigurations = {
            desktop = nixpkgs.lib.nixosSystem {
                modules = [./hosts];
                specialArgs = {
                    inherit inputs;
                    username = "sokoshy";
                    hostname = "desktop";
                };
            };
        };
    };
}
