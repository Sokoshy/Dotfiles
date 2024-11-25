{ pkgs, ...}:
{
    home.packages = with pkgs; [
        fastfetch

        tree

        #terminal
        btop
        htop

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
        # helix
        vscode
        exercism
    ];
}
