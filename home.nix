{ config, pkgs, ... }:

{
  home.username = "blackwew";
  home.homeDirectory = "/home/blackwew";
  
  home.stateVersion = "22.11";
  
  home.packages = [
    
  ];

  home.file = {
  ".gitconfig".source = ./config/gitconfig;
  ".config/alacritty/alacritty.yml".source = ./config/alacritty/alacritty.yml;
  ".config/alacritty/catppuccin-mocha.yml".source = ./config/alacritty/catppuccin-mocha.yml;
  ".config/mpv/mpv.conf".source = ./config/mpv/mpv.conf;
  ".config/mpv/input.conf".source = ./config/mpv/input.conf;
  ".config/neofetch/config.conf".source = ./config/neofetch/config.conf;
  ".tmux.conf".source = ./config/tmux.conf;
  
  };

  home.sessionVariables = {
    
  };
  
  programs.home-manager.enable = true;
}

