{...}: {
  # Ghostty
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      background-opacity = 0.8;
      window-decoration = "none";
      # Font
      font-size = 11;
      font-family = "JetBrainsMono Nerd Font Mono";
      font-family-bold = "JetBrainsMono NFM Bold";
      font-family-italic = "JetBrainsMono NFM Italic";
      font-family-bold-italic = "JetBrainsMono NFM Bold Italic";
      # Padding
      window-padding-balance = true;
      window-padding-x = 4;
      window-padding-y = 4;
      # Cursor
      shell-integration-features = "no-cursor";
      cursor-style = "block";
      cursor-invert-fg-bg = true;
      # Window
      window-width = 80;
      window-height = 18;
      # Other
      focus-follows-mouse = true;
      clipboard-paste-protection = true;
      unfocused-split-fill = "#222222";
    };
  };
}
