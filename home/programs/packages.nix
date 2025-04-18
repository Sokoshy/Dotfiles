{ pkgs, ...}:
{
  home.packages = with pkgs; [
    fastfetch

    # utils
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # misc
    which
    tree

    # code
    vim
    neovim
    zed-editor
    exercism
    rustup
    gcc

    # app
    google-chrome
    brave
    anytype
    vesktop
    gimp
    ookla-speedtest


    # nix related / terminal
    ghostty
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

  ];
}