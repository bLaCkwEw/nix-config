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

        spellcheck = {
          enable = true;
          programmingWordlist.enable = true;
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
          # {
          #   key = "<leader>t";
          #   mode = "n";
          #   action = ":terminal<CR>";
          #   silent = true;
          #   desc = "Open terminal";
          # }
        ];

        # Plugins
        visuals = {
          nvim-web-devicons.enable = true;
          indent-blankline.enable = true;
        };

        hideSearchHighlight = true;

        ui = {
          colorizer.enable = true;
        };

        diagnostics.config.underline = true;

        diagnostics.nvim-lint.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
          # hardtime-nvim.enable = true;
        };

        git = {
          enable = true;
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
            # precognition.enable = true;
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
            # setupOpts = {
            #   sources = {
            #     default = [
            #       "lsp"
            #       "path"
            #       "snippets"
            #       "buffer"
            #     ];
            #   };
            # };
          };
        };

        extraPlugins = {
          lazy-lsp-nvim = {
            package = pkgs.vimPlugins.lazy-lsp-nvim;
            setup = ''
              require("lazy-lsp").setup {
              	excluded_servers = {
                  "ccls",                            -- prefer clangd
                  "denols",                          -- prefer eslint and tsserver
                  "docker_compose_language_service", -- yamlls should be enough?
                  "flow",                            -- prefer eslint and tsserver
                  "ltex",                            -- grammar tool using too much CPU
                  "quick_lint_js",                   -- prefer eslint and tsserver
                  "rnix",                            -- archived on Jan 25, 2024
                  "scry",                            -- archived on Jun 1, 2023
                  "tailwindcss",                     -- associates with too many filetypes
                },
                preferred_servers = {
                  markdown = { "marksman" },
                  python = { "pyright", "ruff_lsp" },
                },
              }
            '';
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
          enableTreesitter = true;
          enableFormat = true;

          # astro.enable = true;
          bash.enable = true;
          css.enable = true;
          html.enable = true;
          nix.enable = true;
          lua.enable = true;
          markdown.enable = true;
          # svelte.enable = true;
          ts.enable = true;
        };

        telescope = {
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
  };
}
