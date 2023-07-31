{ config, pkgs, ... }:

{
  home.username = "blackwew";
  home.homeDirectory = "/home/blackwew";
  
  home.stateVersion = "22.11";
  
  home.packages = [
    
  ];
  
  # Themeing
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Classic";
  
  # Config files (To remove once configs are migrated)
  home.file = {
  # Git
  ".gitconfig".source = ./config/gitconfig;
  # Alacritty
  ".config/alacritty/alacritty.yml".source = ./config/alacritty/alacritty.yml;
  ".config/alacritty/catppuccin-mocha.yml".source = ./config/alacritty/catppuccin-mocha.yml;
  # MPV
  ".config/mpv/mpv.conf".source = ./config/mpv/mpv.conf;
  ".config/mpv/input.conf".source = ./config/mpv/input.conf;
  ".config/neofetch/config.conf".source = ./config/neofetch/config.conf;
  # Tmux
  ".tmux.conf".source = ./config/tmux.conf;
  # Fish
  ".config/fish/config.fish".source = ./config/fish/config.fish;
  ".config/fish/fish_variables".source = ./config/fish/fish_variables;
  ".config/fish/conf.d/__async_prompt.fish".source = ./config/fish/conf.d/__async_prompt.fish;
  ".config/fish/conf.d/autopair.fish".source = ./config/fish/conf.d/autopair.fish;
  ".config/fish/conf.d/mocha.fish".source = ./config/fish/conf.d/mocha.fish;
  ".config/fish/conf.d/plugin-bang-bang.fish".source = ./config/fish/conf.d/plugin-bang-bang.fish;
  ".config/fish/functions/_autopair_backspace.fish".source = ./config/fish/functions/_autopair_backspace.fish;
  ".config/fish/functions/_autopair_insert_left.fish".source = ./config/fish/functions/_autopair_insert_left.fish;
  ".config/fish/functions/_autopair_insert_right.fish".source = ./config/fish/functions/_autopair_insert_right.fish;
  ".config/fish/functions/_autopair_insert_same.fish".source = ./config/fish/functions/_autopair_insert_same.fish;
  ".config/fish/functions/_autopair_tab.fish".source = ./config/fish/functions/_autopair_tab.fish;
  ".config/fish/functions/fish_greeting.fish".source = ./config/fish/functions/fish_greeting.fish;
  ".config/fish/functions/fish_prompt.fish".source = ./config/fish/functions/fish_prompt.fish;
  ".config/fish/functions/__history_previous_command.fish".source = ./config/fish/functions/__history_previous_command.fish;
  ".config/fish/functions/__history_previous_command_arguments.fish".source = ./config/fish/functions/__history_previous_command_arguments.fish;
  ".config/fish/functions/man.fish".source = ./config/fish/functions/man.fish;
  };

  home.sessionVariables = {
    
  };
  
  programs.home-manager.enable = true;
}

