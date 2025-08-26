require("oil").setup({
	delete_to_trash = true,
	watch_for_changes = true,
	use_default_keymaps = false,
	keymaps = {
		["<CR>"] = "actions.select",
	},
	view_options = {
		show_hidden = true,
	}
})

-- Open oil keybind
vim.keymap.set('n', '<leader>d', ':Oil --float<CR>', { desc = "Open parent directory" })
