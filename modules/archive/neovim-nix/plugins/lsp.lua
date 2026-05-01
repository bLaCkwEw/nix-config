local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings to learn the available actions
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
  -- Also load LSP Format
  require("lsp-format").setup {}
  require("lsp-format").on_attach(client, bufnr)
end)
-- Format on save
require("lspconfig").gopls.setup { on_attach = on_attach }

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

vim.lsp.handlers["textDocument/diagnostic"] = vim.lsp.with(
  vim.lsp.diagnostic.on_diagnostic, {
    underline = true, -- Enable underline, use default values
    update_in_insert = true, -- Disable a feature
  }
)

