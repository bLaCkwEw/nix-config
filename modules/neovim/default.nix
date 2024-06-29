{ config, pkgs, ... }:

{
  # Neovim
  programs.neovim = 
  let
  	toLuaString = str: "lua << EOF\n${str}\nEOF\n";
  	toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
  	enable = true;
  	
  	viAlias = true;
  	vimAlias = true;
  	vimdiffAlias = true;
  	
  	withNodeJs = true;
  	
  	extraPackages = with pkgs; [
  		lua-language-server
  		wl-clipboard
  	];
  	
  	extraLuaConfig = ''
  		-- Read options file
  		${builtins.readFile ./options.lua}
  	'';
  	
  	plugins = with pkgs.vimPlugins; [
			which-key-nvim
			telescope-fzf-native-nvim
			vim-nix
			
			{
				plugin = catppuccin-nvim;
				config = toLuaFile ./plugins/catppuccin.lua;
			}
			{
				plugin = comment-nvim;
				config = toLuaString "require(\"Comment\").setup()";
			}
			
			{
				plugin = (nvim-treesitter.withPlugins (p: [
				# On search.nixos.org you have to search for
				# vimPlugins.nvim-treesitter-parsers.NAME
					p.tree-sitter-astro
					p.tree-sitter-bash
					p.tree-sitter-javascript
					p.tree-sitter-json  		
					p.tree-sitter-lua
					p.tree-sitter-nix
					p.tree-sitter-svelte
					p.tree-sitter-typescript
				]));
				config = toLuaFile ./plugins/treesitter.lua;
			}
  	];
  };
}

