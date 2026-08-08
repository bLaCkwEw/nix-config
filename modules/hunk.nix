{ ... }: {
  # Hunk - terminal-first diff viewer
  programs.hunk = {
    enable = true;
    enableGitIntegration = true; # set hunk as default git pager
    settings = {
      theme = "catppuccin-mocha";
      mode = "auto";
      line_numbers = true;
      tab_width = 4;
      menu_bar = false;
    };
  };
}
