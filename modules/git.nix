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
	  	push.autoSetupRemote = true;
	  	commit.verbose = true;
	  	help.autocorrect = "prompt";
	  	diff.algorithm = "histogram";
	  	merge.conflictstyle = "zdiff3";
	  	branch.sort = "-committerdate";
	  	# merge.tool = "meld";
  	};
  };
}
