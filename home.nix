{ config, pkgs, ... }:

{
	imports = [
		./modules/alacritty.nix
		./modules/fish.nix
		./modules/git.nix
		./modules/mpv.nix
		./modules/bat.nix
		./modules/eza.nix
		./modules/zellij.nix
		./modules/zoxide.nix
		./modules/syncthing.nix
	];
	
	
	# User settings
  home.username = "blackwew";
  home.homeDirectory = "/home/blackwew";
  
  # Home manager version
  home.stateVersion = "23.11";
  
  # Turn on home manager
  programs.home-manager.enable = true;
  
  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;
  
  
  # Installed packages for local user
  home.packages = with pkgs; [
  	# Unfree
    vscode
    # obsidian
    spotify
    discord
    # Free
    mpv
    stremio
    transmission-gtk
    scrcpy
    nodejs_20
    nodePackages_latest.pnpm
    ventoy-full
    croc
    fzf
    bitwarden
    bleachbit
    ollama
];
  
  
  # Themeing
  gtk.enable = true;
  gtk.cursorTheme = {
  	package = pkgs.bibata-cursors;
  	name = "Bibata-Modern-Classic";
  };
  
  
  # Package configs -- to move to individual files
  
  
  # Config files (To remove once configs are migrated)
  home.file = {
  # Neofetch
  ".config/neofetch/config.conf".source = ./modules/neofetch/config.conf;
  
  # Fish
  ".config/fish" = {
    source = ./modules/fish;
    recursive = true;
  };
  };
  
  
  # Environment variables for local user
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    TERM = "alacritty";
    
    # pnpm
    PNPM_HOME = "/home/blackwew/media/.pnpm-store/";
  };
}

