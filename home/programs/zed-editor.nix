{
    programs.zed-editor = {
        enable = true;

        extensions = [
            "nix"
            "rose-pine-theme"
            "toml"
            "java"
        ];
        userSettings = {
            telemetry = {
                metrics = false;
            };
            ui_font_size = 16;
            buffer_font_size = 16;
            base_keymap = "VSCode";
            theme = {
                mode = "system";
                light = "Rosé Pine Dawn";
                dark = "Rosé Pine Moon";
            };
            format_on_save = "on";
        };
    };

}
