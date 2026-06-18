{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/ghostty.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/mpv.nix
    ./modules/bat.nix
    ./modules/eza.nix
    ./modules/zoxide.nix
    ./modules/neovim
    ./modules/dconf
    ./modules/nh.nix
    ./modules/music/default.nix
  ];

  # User settings
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  # Home manager version
  home.stateVersion = "24.05";

  # Turn on home manager
  programs.home-manager.enable = true;

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
  ];

  # Installed packages for local user
  home.packages = with pkgs; [
    # Unfree
    # -

    # Free
    pnpm
    blender
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
    ".config/fish/functions" = {
      source = ./modules/fish/functions;
      recursive = true;
    };
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
    BROWSER = "firefox";
    TERMINAL = "ghostty";
    TERM = "ghostty";

    # pnpm
    PNPM_HOME = "/home/gabriel/media/.pnpm-store/";
  };
}
