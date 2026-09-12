{
  home.file = {
    # Skills directories
    ".agents/skills" = {
      source = ./skills;
      recursive = true;
    };
    ".pi/agent/skills" = {
      source = ./skills;
      recursive = true;
    };
    ".codex/skills" = {
      source = ./skills;
      recursive = true;
    };

    # AGENTS.md
    ".agents/AGENTS.md".source = ./AGENTS.md;
    ".pi/agent/AGENTS.md".source = ./AGENTS.md;
    ".codex/AGENTS.md".source = ./AGENTS.md;
  };

}
