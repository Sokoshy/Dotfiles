{hostname, ...}: {

    time.timeZone = "Europe/Paris";

    system = {
        stateVersion = "24.11";
    };

    nixpkgs.config.allowUnfree = true;

    nix = {
        gc = {
            automatic = true;
            dates     = "daily";
            options   = "--delete-older-than 4d";
        };

        optimise = {
            automatic = true;
            dates = ["20:00"];
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