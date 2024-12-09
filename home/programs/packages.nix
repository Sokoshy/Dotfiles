{ pkgs, ...}:
{
    home.packages = with pkgs; [
        fastfetch

        tree

        #terminal
        btop
        htop

        #font
        (pkgs.nerdfonts.override {
              fonts = [
                "NerdFontsSymbolsOnly"
              ];
            })

        #app
        google-chrome
        youtube-music
        spotify
        anytype
        gimp
        vesktop

        ookla-speedtest

        vlc

        #Dev
        vim
        neovim
        # helix
        vscode
        exercism
    ];
}
