{ pkgs, stable, inputs, ...}:
{
  home.packages = with pkgs; [
    fastfetch

    # utils
    eza 
    fzf

    # util
    ripgrep
    which
    eza
    fzf

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    nmap
    ipcalc  # it is a calculator for the IPv4/v6 addresses

     # misc
    cowsay
    tree
    kdePackages.kate

    # code
    neovim
    zed-editor
    vscode
    exercism
    gcc

    # app
    pear-desktop #youtube-music
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    firefox
    vivaldi
    stable.anytype
    affine
    bitwarden-desktop
    vesktop
    gimp
    onlyoffice-desktopeditors
    ookla-speedtest

    # fonts
    nerd-fonts.symbols-only

    # nix related / terminal
    ghostty
    zellij
    tmux
    btop 
    iotop # io monitoring
    iftop # network monitoring

     # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

  ];
}