{ ... }:

{
  # Ghostty
	programs.ghostty = {
		enable = true;
    settings = {
      theme = "catppuccin-mocha";
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
      # Window
      window-width = 80;
      window-height = 18;
      # Other
      focus-follows-mouse = true;
      clipboard-paste-protection = true;
      };
	};
}
