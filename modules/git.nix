{ ... }:

{
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
}
