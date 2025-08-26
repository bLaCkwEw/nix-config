-- Set up luasnip
local ls = require "luasnip"
ls.config.set_config {
	history = false,
	updateevents = "TextChanged", "TextChangedI",
}

-- Go to next jumpable
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true }
)

-- Go to prev jumpable
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true }
)

-- Add VSCode like snippets
require("luasnip.loaders.from_vscode").lazy_load()
