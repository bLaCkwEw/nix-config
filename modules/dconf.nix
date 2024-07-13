{ lib, ... }:

with lib.hm.gvariant;
{
  # Dconf Settings
  # Sets up GNOME keybinds
  
  dconf = {
		settings = {
		  # Custom Shortcuts
		  "" = {
		    custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" ];
		    screenshot = [ "Print" ];
		    show-screenshot-ui = [ "<Shift><Super>s" ];
		    toggle-message-tray = [ "<Control><Alt>v" ];
		    # WM Related
		    close = [ "<Control><Alt>w" ];
		    maximize = [];
		    maximize-vertically = [];
		    minimize = [ "<Control><Alt>Down" ];
		    show-desktop = [ "<Super>d" ];
		    switch-applications = [];
		    switch-applications-backward = [];
		    switch-to-workspace-1 = [ "<Control><Super>F1" ];
		    switch-to-workspace-2 = [ "<Control><Super>F2" ];
		    switch-to-workspace-3 = [ "<Control><Super>F3" ];
		    switch-to-workspace-4 = [ "<Control><Super>F4" ];
		    switch-to-workspace-down = [];
		    switch-to-workspace-left = [ "<Alt><Super>Left" ];
		    switch-to-workspace-right = [ "<Alt><Super>Right" ];
		    switch-to-workspace-up = [];
		    switch-windows = [ "<Alt>Tab" ];
		    switch-windows-backward = [ "<Shift><Alt>Tab" ];
		    toggle-maximized = [ "<Control><Alt>Up" ];
		  };

		  "custom-keybindings/custom0" = {
		  	# Use Super+T for testing, then change back to Super+Return
		  	# binding = "<Super>Return";
		    binding = "<Super>t";
		    command = "alacritty";
		    name = "Launch Terminal";
		  };

		  "custom-keybindings/custom1" = {
		    binding = "<Super>f";
		    command = "firefox";
		    name = "Launch Firefox";
		  };

		  "custom-keybindings/custom2" = {
		    binding = "<Super>e";
		    command = "nautilus";
		    name = "Launch Files";
		  };

		  "custom-keybindings/custom3" = {
		    binding = "<Alt><Super>f";
		    command = "firefox -P Work";
		    name = "Launch Firefox (Work)";
		  };
		};
	};
}
