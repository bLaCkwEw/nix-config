require('telescope').setup({
	extensions = {
    	fzf = {
      	fuzzy = true,                    -- false will only do exact matching
      	override_generic_sorter = true,  -- override the generic sorter
      	override_file_sorter = true,     -- override the file sorter
      	case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    	}
  	}
})
require('telescope').load_extension('fzf')

-- Set keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope find files"})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {desc = "Telescope search old files"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Telescope open buffers"})

