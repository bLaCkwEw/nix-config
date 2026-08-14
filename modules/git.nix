{ ... }: {
  programs = {
    # Git
    git = {
      enable = true;

      settings = {
        init.defaultBranch = "master";
        credential.helper = "store";
        push.autoSetupRemote = true;
        commit.verbose = true;
        help.autocorrect = "prompt";
        diff.algorithm = "histogram";
        merge.conflictstyle = "zdiff3";
        branch.sort = "-committerdate";
        rerere.enabled = "true";

        user = {
          name = "bLaCkwEw";
          email = "35146970+bLaCkwEw@users.noreply.github.com";
        };
      };
      signing.format = null;
    };

    # Lazy Git
    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };

    # Hunk Diff
    hunk = {
      enable = true;
      enableGitIntegration = true;
      settings = {
        theme = "catppuccin-mocha";
        mode = "auto";
        line_numbers = true;
        tab_width = 4;
        menu_bar = false;
      };
    };
  };
}
