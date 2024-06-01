{ ... }:

{
  # Fastfetch
  programs.fastfetch = {
  	enable = true;
  	settings = {
  		logo.source = "nixos_old_small";
  		modules = [
  			"title"
        "separator"
        "os"
        "uptime"
        "shell"
        "theme"
        "memory"
      ];
  	};
  };
}

