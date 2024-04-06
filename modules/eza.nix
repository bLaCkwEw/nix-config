{ ... }:

{
  # Eza
  programs.eza = {
  	enable = true;
  	icons = true;
		extraOptions = [ 
			"--classify" 
			"--group-directories-first"
		];
		enableFishIntegration = true;
  };
}

