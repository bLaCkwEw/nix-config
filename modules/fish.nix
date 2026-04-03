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
    };

    shellAliases = {
      # Various
      c = "clear";
      e = "exit";
      q = "exit";
      h = "history --max=10";
      rm = "rm -drvI";
      cat = "bat";
      pnpr = "pnpm run";
      # Git
      gcd = "git commit -v -m \"$(date +'%Y-%m-%d %H:%M')\"";
    };
  };
}
