{pkgs, ...}: {
  # Neovim through NVF
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        # Theme
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        # Clipboard
        clipboard = {
          enable = true;
          registers = "unnamedplus";
          providers.wl-copy.enable = true;
        };

        # Options
        options = {
          tabstop = 2;
          shiftwidth = 2;
          mouse = "a";
          ignorecase = true;
          smartcase = true;
        };

        # Keybinds
        keymaps = [
          # oil-nvim
          {
            key = "<leader>d";
            mode = "n";
            action = ":Oil --float<CR>";
            silent = false;
            desc = "Open parent directory with oil-nvim";
          }
          # fzf-lua
          {
            key = "<leader>ff";
            mode = "n";
            action = ":FzfLua files<CR>";
            silent = false;
            desc = "Fuzzy find files";
          }
          {
            key = "<leader>fo";
            mode = "n";
            action = ":FzfLua oldfiles<CR>";
            silent = false;
            desc = "Fuzzy find recently opened files";
          }
          {
            key = "<leader>fb";
            mode = "n";
            action = ":FzfLua buffers<CR>";
            silent = false;
            desc = "Fuzzy find buffers";
          }
          {
            key = "<leader>fgg";
            mode = "n";
            action = ":FzfLua grep<CR>";
            silent = false;
            desc = "Fuzzy find grepped word";
          }
          {
            key = "<leader>fgl";
            mode = "n";
            action = ":FzfLua live_grep_native<CR>";
            silent = false;
            desc = "Fuzzy find grepped word live";
          }
          {
            key = "<leader>fa";
            mode = "n";
            action = ":FzfLua<CR>";
            silent = false;
            desc = "Fuzzy find anything through fzf-lua";
          }
          # Save buffer
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
          # Search highlight
          {
            key = "<Esc>";
            mode = "n";
            action = ":noh<return><Esc>";
            silent = true;
            desc = "Turn off highlight untill next search";
          }
        ];

        # Plugins
        visuals = {
          nvim-web-devicons.enable = true;
          indent-blankline.enable = true;
        };

        ui = {
          colorizer.enable = true;
        };

        diagnostics.config.underline = true;

        diagnostics.nvim-lint.enable = true;

        binds = {
          whichKey.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        tabline = {
          nvimBufferline = {
            enable = true;
            mappings = {
              cycleNext = "<leader>bn";
              cyclePrevious = "<leader>bp";
            };
          };
        };

        mini = {
          pairs.enable = true;
          statusline.enable = true;
          comment.enable = true;
          move.enable = true;
        };

        notes.todo-comments.enable = true;

        utility = {
          oil-nvim = {
            enable = true;
            setupOpts = {
              delete_to_trash = true;
              watch_for_changes = true;
              use_default_keymaps = false;
              keymaps = {
                "<CR>" = "actions.select";
              };
              view_options = {
                show_hidden = true;
              };
            };
          };
          motion = {
            hop.enable = true;
            leap.enable = true;
          };
        };

        autocomplete = {
          blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;
            mappings = {
              next = "<C-n>";
              previous = "<C-p>";
            };
          };
        };

        snippets.luasnip.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
        };

        treesitter = {
          enable = true;
          context.enable = true;
          autotagHtml = true;
        };

        languages = {
          # Global settings
          enableTreesitter = true;
          enableFormat = true;

          # Languages
          astro.enable = true;
          bash.enable = true;
          css.enable = true;
          html.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          svelte.enable = true;
          ts.enable = true;
        };

        fzf-lua = {
          enable = true;
          profile = "fzf-native";
        };
      };
    };
  };
}
