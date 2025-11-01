{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/alacritty.nix
    ./modules/ghostty.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/jujutsu.nix
    ./modules/mpv.nix
    ./modules/bat.nix
    ./modules/eza.nix
    ./modules/zellij.nix
    ./modules/zoxide.nix
    ./modules/syncthing.nix
    ./modules/neovim-nvf/default.nix
    #./modules/dconf.nix
    ./modules/nh.nix
    ./modules/music/default.nix
    ./modules/distrobox.nix
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
    "ventoy-1.1.07"
  ];

  # Installed packages for local user
  home.packages = with pkgs; [
    # Unfree
    # vscode # not used anymore, switched to neovim
    discord
    # Free
    mpv
    # transmission_4-gtk # broken
    scrcpy
    nodejs_20
    nodePackages_latest.pnpm
    ventoy-full # contains insecure binary blobs
    croc
    fzf
    bitwarden-desktop
    bleachbit
    protonvpn-gui
    turso-cli
    pods
    microfetch
    ffmpeg-full
    # Music related
    lrcget # get synced song lyrics + embed them into the music file
    picard # song metadata
  ];

  # Themeing
  gtk.enable = true;
  gtk.cursorTheme = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
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
