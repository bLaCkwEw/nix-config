require("catppuccin").setup({
	flavour = "mocha",            -- latte, frappe, macchiato, mocha
	transparent_background = true, -- enables transparency
	term_colors = true,           -- sets terminal colors (e.g. `g:terminal_color_0`)
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
