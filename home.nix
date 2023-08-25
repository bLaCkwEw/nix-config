{ config, pkgs, ... }:

{
  home.username = "blackwew";
  home.homeDirectory = "/home/blackwew";
  
  # Installed packages for local user
  home.packages = [
    
  ];
  
  
  # Themeing
  gtk.enable = true;
  gtk.cursorTheme = {
  	package = pkgs.bibata-cursors;
  	name = "Bibata-Modern-Classic";
  };
  
  
  # Package configs -- to move to individual files
  
  # Alacritty
  programs.alacritty = {
  	enable= true;
  	
  	settings = {
  		window = {
  			opacity = 0.8;
  			
  			dimensions = {
  				columns = 80;
  				lines = 20;
  			};
  			
  			padding = {
  				x = 5;
  				y = 2;
  			};
  		};
  		
  		scrolling.history = 2000;
  		
  		font = {
  			size = 11;
  			
  			normal = {
  				family = "JetBrainsMono Nerd Font";
  				style = "Regular";
  			};
  			
  			bold = {
  				family = "JetBrainsMono Nerd Font";
  				style = "Bold";
  			};
  			
  			italic = {
  				family = "JetBrainsMono Nerd Font";
  				style = "Italic";
  			};
  			
  			bold_italic = {
  				family = "JetBrainsMono Nerd Font";
  				style = "Bold Italic";
  			};
  		
  		};
  		
  		env.TERM = "xterm-256color";
  		
  		# Catppuccin Mocha Theme
  		colors = {
  			primary = {
  				background = "#1E1E2E";
  				foreground = "#CDD6F4";
  				dim_foreground = "#CDD6F4";
  				bright_foreground = "#CDD6F4";
  			};
  			
  			normal = {
        	black = "#45475A";
        	red = "#F38BA8";
        	green = "#A6E3A1";
        	yellow = "#F9E2AF";
        	blue = "#89B4FA";
        	magenta = "#F5C2E7";
        	cyan = "#94E2D5";
        	white = "#BAC2DE";
      	};
        
    		bright = {
        	black= "#585B70";
        	red= "#F38BA8";
        	green= "#A6E3A1";
        	yellow= "#F9E2AF";
        	blue= "#89B4FA";
        	magenta= "#F5C2E7";
        	cyan= "#94E2D5";
        	white= "#A6ADC8";
        };
        
    		dim = {
        	black= "#45475A";
        	red= "#F38BA8";
        	green= "#A6E3A1";
        	yellow= "#F9E2AF";
        	blue= "#89B4FA";
        	magenta= "#F5C2E7";
        	cyan= "#94E2D5";
        	white= "#BAC2DE";
        };
  			
  			cursor = {
  				text = "#1E1E2E";
        	cursor = "#F5E0DC";
  			};
  			
  			vi_mode_cursor = {
  				text = "#1E1E2E";
       		cursor = "#B4BEFE";
  			};
  			
  			search = {
  				matches = {
  					foreground = "#1E1E2E";
            background = "#A6ADC8";
  				};
  				focused_match = {
  					foreground = "#1E1E2E";
            background = "#A6E3A1";
  				};
  				footer_bar = {
  					foreground = "#1E1E2E";
            background = "#A6ADC8";
  				};
  			};
  			
  			hints = {
  				start = {
  					foreground = "#1E1E2E";
  					background = "#F9E2AF";
  				};
  				end = {
  				  foreground = "#1E1E2E";
  					background = "#A6ADC8";
  				};
  			};
  			
  			selection = {
					text = "#1E1E2E";
        	background = "#F5E0DC";
  			};
  		};
  	};  	
  };
  
  # Git
  programs.git = {
  	enable = true;
  	
  	userName = "bLaCkwEw";
		userEmail = "35146970+bLaCkwEw@users.noreply.github.com";
  	
  	extraConfig = {
	  	init.defaultBranch = "master";
	  	credential.helper = "store";  		
  	};
  };
  
  # MPV
  programs.mpv = {
  	enable = true;
  	
  	bindings = {
  		WHEEL_UP = "ignore";
  		WHEEL_DOWN = "ignore";
  	};
  	
  	config = {
  		fullscreen = "yes";
  		keep-open = "always";
  		force-seekable = "yes";
  		osd-bar = "no";
  	};
  };
  
  # Config files (To remove once configs are migrated)
  home.file = {
  # Neofetch
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
  
  
  # Environment variables for local user
  home.sessionVariables = {
    
  };
  
  
  # Home manager version
  home.stateVersion = "22.11";
  
  # Turn on home manager
  programs.home-manager.enable = true;
}

