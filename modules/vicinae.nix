{ ... }:
{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    settings = {
      close_on_focus_loss = true;
      favicon_service = "twenty";
      search_files_in_root = false;
      theme = {
        light = {
          name = "catppuccin-mocha";
          icon_theme = "default";
        };
        dark = {
          name = "catppuccin-mocha";
          icon_theme = "default";
        };
      };
      launcher_window.opacity = 0.9;
    };
  };
}
