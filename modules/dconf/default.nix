{ lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/"
      ];
    };

    "org/gnome/shell/keybindings" = {
      screenshot = [ "Print" ];
      show-screenshot-ui = [ "<Shift><Super>s" ];
      toggle-message-tray = [ "<Control><Alt>v" ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Control><Alt>w" ];
      maximize = [ ];
      maximize-vertically = [ ];
      minimize = [ "<Control><Alt>Down" ];
      show-desktop = [ "<Super>d" ];
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-to-workspace-1 = [ "<Control><Super>F1" ];
      switch-to-workspace-2 = [ "<Control><Super>F2" ];
      switch-to-workspace-3 = [ "<Control><Super>F3" ];
      switch-to-workspace-4 = [ "<Control><Super>F4" ];
      switch-to-workspace-down = [ ];
      switch-to-workspace-left = [ "<Alt><Super>Left" ];
      switch-to-workspace-right = [ "<Alt><Super>Right" ];
      switch-to-workspace-up = [ ];
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab" ];
      toggle-maximized = [ "<Control><Alt>Up" ];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Control><Alt>Left" ];
      toggle-tiled-right = [ "<Control><Alt>Right" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "ghostty";
      name = "Launch Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>f";
      command = "firefox";
      name = "Launch Firefox";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>e";
      command = "nautilus";
      name = "Launch Files";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Alt><Super>f";
      command = "firefox -P Work";
      name = "Launch Firefox (Work)";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Shift><Super>p";
      command = "rmpc togglepause";
      name = "RMPC Toggle Pause";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" = {
      binding = "<Shift><Super>period";
      command = "rmpc next";
      name = "RMPC Next";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6" = {
      binding = "<Shift><Super>comma";
      command = "rmpc prev";
      name = "RMPC Prev";
    };
  };
}
