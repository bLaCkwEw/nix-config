{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Neovim
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withRuby = false;
    withNodeJs = false;
    withPython3 = false;

    defaultEditor = true;

    waylandSupport = true;

    initLua = ''
      -- Load keybinds.lua
      ${builtins.readFile ./keybinds.lua}
      -- END keybinds.lua

      -- Load options.lua
      ${builtins.readFile ./options.lua}
      -- END options.lua

      -- Load plugins.lua
      ${builtins.readFile ./plugins.lua}
      -- END plugins.lua
    '';
  };
}
