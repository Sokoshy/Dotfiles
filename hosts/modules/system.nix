{hostname, ...}: {
    time.timeZone = "Europe/Paris";

    system = {
        stateVersion = "24.05";
    };

    nixpkgs = {
        config = {
            allowUnfree = true;
        };
    };

    nix = {
    # gc = {
    #     automatic = true;
    #         dates     = "daily";
    #         options   = "--delete-older-than 4d";
    #     };

        optimise = {
            automatic = true;
            dates = ["daily"];
        };

        settings = {
            auto-optimise-store = true;
            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
      };
}
