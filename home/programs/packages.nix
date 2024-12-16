{ pkgs, ...}:
{
    home.packages = with pkgs; [
        fastfetch

        tree

        #terminal
        btop
        htop

        #font
        nerd-fonts.symbols-only

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
        gcc
        # helix
        vscode
        jetbrains.idea-ultimate
        exercism
    ];
}
