vim.pack.add({
  "https://github.com/nvim-mini/mini.move",
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-mini/mini.pairs",
  "https://github.com/nvim-mini/mini.statusline",
  "https://github.com/catppuccin/nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/dmtrKovalenko/fff.nvim",
  -- LSP
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1",
  },
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/dundalek/lazy-lsp.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
})

-- Mini plugins
require("mini.move").setup({})
require("mini.icons").setup({})
require("mini.pairs").setup({})
require("mini.statusline").setup({})


-- Catppuccin theme
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
})

vim.cmd.colorscheme("catppuccin")

-- Which-key
require("which-key").setup({})

-- Oil-nvim
require("oil").setup({
  delete_to_trash = true,
  watch_for_changes = true,
  use_default_keymaps = false,
  keymaps = {
    ["<CR>"] = "actions.select",
  },
  view_options = {
    show_hidden = true,
  },
})

-- fff
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff.nvim') end
      require('fff.download').download_or_build_binary()
    end
  end,
})

require('fff').setup({
  layout = {
    prompt_position = 'top',
  },
})

-- LSP
-- blink.cmp & lazydev.nvim
require("blink.cmp").setup({
  keymap = { preset = "enter" },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
})
-- lazy-lsp (add AFTER blink.cmp since it needs get_lsp_capabilities)
require("lazy-lsp").setup({
  use_vim_lsp_config = true,
  default_config = {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  },
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
