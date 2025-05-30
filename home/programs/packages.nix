{ pkgs, stable, ...}:
{
  home.packages = with pkgs; [
    fastfetch

    # utils
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # misc
    which

    # code
    vim
    neovim
    zed-editor
    exercism
    gcc

    # app
    google-chrome
    youtube-music
    brave
    stable.anytype
    vesktop
    gimp
    ookla-speedtest

    # fonts
    nerd-fonts.symbols-only

    # nix related / terminal
    ghostty
    zellij
    tmux
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

  ];
}