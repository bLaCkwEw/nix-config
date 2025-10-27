{...}: {
  # Git
  programs = {
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
    };

    # Lazy Git
    lazygit = {
      enable = true;
    };
  };
}
