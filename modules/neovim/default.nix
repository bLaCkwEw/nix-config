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

			#withNodeJs = true;

			extraPackages = with pkgs; [
				wl-clipboard
			];

			extraLuaConfig = ''
			-- Read options file
				${ builtins.readFile ./options.lua }
			-- Read the keybinds file
				${ builtins.readFile ./keybinds.lua }
			'';

			plugins = with pkgs.vimPlugins; [
				nvim-web-devicons

				{
					plugin = oil-nvim;
					config = toLuaFile ./plugins/oil.lua;
				}

				{
					plugin = mini-nvim;
					config = toLuaFile ./plugins/mini.lua;
				}

				#Telescope
				telescope-nvim
				{
					plugin = telescope-fzf-native-nvim;
					config = toLuaFile ./plugins/telescope.lua;
				}

				# LSP
				cmp-nvim-lsp
				cmp-path
				cmp-buffer
				cmp_luasnip
				friendly-snippets
				lsp-zero-nvim
				lsp-format-nvim
				{
					plugin = nvim-cmp;
					config = toLuaFile ./plugins/cmp.lua;
				}
				{
					plugin = lazy-lsp-nvim;
					config = toLuaFile ./plugins/lsp.lua;
				}
				{
					plugin = luasnip;
					config = toLuaFile ./plugins/luasnip.lua;
				}

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

