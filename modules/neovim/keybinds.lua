-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Oil-nvim
vim.keymap.set("n", "<leader>d", "<cmd>Oil --float<CR>", { desc = "Open parent directory with oil-nvim" })

-- Save buffer
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file with CTRL + S", silent = true })
vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file with CTRL + S", silent = true })
vim.keymap.set("v", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file with CTRL + S", silent = true })

-- Search highlight
vim.keymap.set("n", "<Esc>", "<cmd>noh<return><Esc>", { desc = "Turn off highlight until next search", silent = true })

-- fff
vim.keymap.set('n', 'ff', function() require('fff').find_files() end, { desc = 'FFFind files' })
vim.keymap.set('n', 'fg', function() require('fff').live_grep() end, { desc = 'FFFind files' })

