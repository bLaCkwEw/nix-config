{...}: {
  # Fish Shell
  programs.fish = {
    enable = true;

    # Auto-generate completions from man pages
    generateCompletions = true;

    # Abbreviations (expand as you type)
    shellAbbrs = {
      # Git
      gs = "git status";
      gc = "git commit -v";
      ga = "git add";
      gaa = "git add .";
      gpu = "git pull";
      gps = "git push";

      # Various
      rm = "rm -drvI";
      h = "history --max=10";
      c = "clear";
      e = "exit";
      q = "exit";
      pnpr = "pnpm run";
      cat = "bat";
    };

    shellAliases = {
      # Git
      gcd = "git commit -v -m \"$(date +'%Y-%m-%d %H:%M')\"";
    };
  };
}
