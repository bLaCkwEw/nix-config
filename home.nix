{
  config,
  pkgs,
  ...
}: {
  imports = [
    # ./modules/alacritty.nix
    ./modules/ghostty.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/mpv.nix
    ./modules/bat.nix
    ./modules/eza.nix
    # ./modules/zellij.nix
    ./modules/zoxide.nix
    ./modules/syncthing.nix
    ./modules/neovim-nvf/default.nix
    #./modules/dconf.nix
    ./modules/nh.nix
    ./modules/music/default.nix
    # ./modules/distrobox.nix
  ];

  # User settings
  home.username = "blackwew";
  home.homeDirectory = "/home/blackwew";

  # Home manager version
  home.stateVersion = "24.05";

  # Turn on home manager
  programs.home-manager.enable = true;

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.10"
  ];

  # Installed packages for local user
  home.packages = with pkgs; [
    # Unfree
    discord

    mpv
    # transmission_4-gtk # broken
    scrcpy
    nodejs_25
    pnpm
    ventoy-full # contains insecure binary blobs
    croc
    fzf
    bitwarden-desktop
    bleachbit
    # protonvpn-gui # broken deps 2025-11-15
    turso-cli
    pods
    microfetch
    ffmpeg-full
    # Music related
    lrcget # get synced song lyrics + embed them into the music file
    picard # song metadata

    # AI
    opencode
    ollama
  ];

  # Themeing
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
    gtk4.theme = config.gtk.theme;
  };

  # Config files (To remove once configs are migrated)
  home.file = {
    # Fish
    ".config/fish/conf.d" = {
      source = ./modules/fish/conf.d;
      recursive = true;
    };
  };

  # Add local bin to path
  home.sessionPath = ["$HOME/.local/bin"];

  # Environment variables for local user
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "ghostty";
    TERM = "ghostty";

    # pnpm
    PNPM_HOME = "/home/blackwew/media/.pnpm-store/";
  };
}
