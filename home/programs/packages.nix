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
        discord
        youtube-music
        #anytype

        vlc

        #Dev
        vim
        helix
        vscode
    ];
}
