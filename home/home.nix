{ hostname, username, ... }:
{
  imports =
    if hostname == "nixos-desktop" then
      [
        ./programs/archives.nix
        ./programs/gaming.nix
        ./programs/git.nix
        ./programs/packages.nix
        ./programs/vscode.nix
      ]
    else if hostname == "nixos-laptop" then
      [
        ./programs/archives.nix
        ./programs/git.nix
        ./programs/packages.nix
        ./programs/shell.nix
      ]
    else
      [ ];
  
  home = {
    username = "${username}";
      homeDirectory = "/home/${username}";
      stateVersion = "25.11";
  };
}

# { config, pkgs, stable, inputs, username, hostname, ... }:

# {

  # Import files from the current configuration directory into the Nix store,
  # and create symbolic links pointing to those store files in the Home directory.

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  #xresources.properties = {
   # "Xcursor.size" = 16;
    #"Xft.dpi" = 172;
  #};

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [

  #   fastfetch
  #   inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  #   vscode

    # archives
    # zip
    # xz
    # unzip
    # p7zip

    # utils
    # ripgrep # recursively searches directories for a regex pattern
    # eza # A modern replacement for ‘ls’
    # fzf # A command-line fuzzy finder

    # # networking tools
    # nextdns
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # # misc
    # cowsay
    # tree
    # kdePackages.kate

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    #nix-output-monitor

    # productivity

    # btop  # replacement of htop/nmon
    # iotop # io monitoring
    # iftop # network monitoring

    # # system call monitoring
    # strace # system call monitoring
    # ltrace # library call monitoring
    # lsof # list open files

    # # system tools
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    # pciutils # lspci
    # usbutils # lsusb
  # ];

  # basic configuration of git, please change to your own
  #programs.git = {
  #  enable = true;
  #  userName = "Ryan Yin";
  #  userEmail = "xiaoyin_c@qq.com";
  #};

  # starship - an customizable prompt for any shell
  #programs.starship = {
  #  enable = true;
  #  # custom settings
  #  settings = {
  #    add_newline = false;
  #    aws.disabled = true;
  #    gcloud.disabled = true;
  #    line_break.disabled = true;
  #  };
  #};


  # programs.bash = {
  #   enable = true;
  #   enableCompletion = true;
  # };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  # home.stateVersion = "25.11";
#   home = {
#     username = "${username}";
#       homeDirectory = "/home/${username}";
#       stateVersion = "25.11";
#   };
# }
