{ ... }:

{
  # Fish Shell
    programs.fish = {
    	enable = true;
    	
    	shellAliases = {
    		# Various aliases
    		c = "clear";
    		e = "exit";
    		q = "exit";
    		h = "history --max=10";
    		rm = "rm -drvI";
    		cat = "bat";
    		pnpr = "pnpm run";
    		# Git
    		gs = "git status";
    		gc = "git commit -v";
		gcd = "git commit -v -m $(date +'%Y-%m-%d %H:%M')";
    		ga = "git add";
    		gaa = "git add .";
    		gpu = "git pull";
    		gps = "git push";
    	};
    };
}
