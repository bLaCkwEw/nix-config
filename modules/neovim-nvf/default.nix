{
  config,
  pkgs,
  ...
}: {
  # Neovim through NVF
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = true;
      vim.vimAlias = true;

      # Theme
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      # Clipboard
      vim.clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      # Options
      vim.options.tabstop = 2;
      vim.options.shiftwidth = 2;
      vim.options.mouse = "a";
      vim.hideSearchHighlight = true;
      vim.options = {
        ignorecase = true;
        smartcase = true;
      };

      # Keybinds
      vim.keymaps = [
        # oil-nvim
        {
          key = "<leader>d";
          mode = "n";
          action = ":Oil --float<CR>";
          silent = false;
          desc = "Open parent directory with oil-nvim";
        }
        {
          key = "<C-s>";
          mode = "n";
          action = ":w<CR>";
          silent = true;
          desc = "Save file with CTRL + S";
        }
        {
          key = "<C-s>";
          mode = ["i" "v"];
          action = "<Esc>:w<CR>";
          silent = true;
          desc = "Save file with CTRL + S";
        }
        {
          key = "<leader>t";
          mode = "n";
          action = ":terminal<CR>";
          silent = true;
          desc = "Open terminal";
        }
      ];

      # Plugins
      vim.visuals.nvim-web-devicons.enable = true;

      vim.mini.pairs.enable = true;
      vim.mini.statusline.enable = true;
      vim.mini.comment.enable = true;
      vim.mini.move.enable = true;

      vim.utility.oil-nvim = {
        enable = true;
        setupOpts = {
          delete_to_trash = true;
          watch_for_chantes = true;
          use_default_keymaps = false;
          keymaps = {
            "<CR>" = "actions.select";
          };
          view_options = {
            show_hidden = true;
          };
        };
      };

      vim.autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        mappings.next = "<C-n>";
        mappings.previous = "<C-p>";
      };

      vim.lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
      };

      vim.snippets.luasnip.enable = true;

      vim.languages = {
        enableTreesitter = true;
        enableFormat = true;

        html.enable = true;
        nix.enable = true;
        astro.enable = true;
        ts.enable = true;
      };

      vim.telescope = {
        enable = true;
        extensions = [
          {
            name = "fzf";
            packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
            setup = {
              fzf = {
                fuzzy = true;
                override_generic_sorter = true;
                override_file_sorter = true;
                case_mode = "smart_case";
              };
            };
          }
        ];
      };
    };
  };
}
