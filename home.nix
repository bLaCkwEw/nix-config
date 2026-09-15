{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/ghostty.nix
    ./modules/fish
    ./modules/git.nix
    ./modules/mpv.nix
    ./modules/bat.nix
    ./modules/eza.nix
    # ./modules/zellij.nix
    ./modules/zoxide.nix
    ./modules/syncthing.nix
    ./modules/neovim
    ./modules/dconf
    ./modules/cursors.nix
    ./modules/nh.nix
    ./modules/music
    ./modules/agent-stuff
    ./modules/vicinae.nix
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
    "ventoy-1.1.17"
    "electron-39.8.10"
  ];

  # Installed packages for local user
  home.packages = with pkgs; [
    # Unfree
    discord

    mpv
    scrcpy
    nodejs_latest
    pnpm
    ventoy-full # contains insecure binary blobs
    # croc
    fzf
    bitwarden-desktop
    bleachbit
    mission-center
    ffmpeg-full
    calibre

    blender

    # Music related
    lrcget # get synced song lyrics + embed them into the music file
    picard # song metadata
  ];

  # Themeing
  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
  };

  # Add local bin to path
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/media/.pnpm-store/bin/"
  ];

  # Environment variables for local user
  home.sessionVariables = {
    # EDITOR = "nvim";
    # VISUAL = "nvim";
    BROWSER = "app.zen_browser.zen";
    TERMINAL = "ghostty";
    TERM = "ghostty";

    # pnpm
    PNPM_HOME = "/home/blackwew/media/.pnpm-store/";
  };
}
