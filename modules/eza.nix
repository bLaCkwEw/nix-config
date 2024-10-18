{ ... }:

{
  # Eza
  programs.eza = {
  	enable = true;
  	icons = "auto";
		extraOptions = [ 
			"--classify" 
			"--group-directories-first"
		];
		enableFishIntegration = true;
  };
}

