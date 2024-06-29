-- Set leader to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Sync clipboard with system
vim.opt.clipboard = 'unnamedplus'

-- Line numbers (I think)
vim.opt.number = true

-- Keep signcolumn on by default (idk what it does)
vim.opt.signcolumn = 'yes'

-- Set tab width to 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- How long to wait before swap file is written to disk
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time to display which-key faster
vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- Enable 24-bit RGB color support
vim.opt.termguicolors = true

-- Mouse support for all modes
vim.opt.mouse = 'a'

-- Tell nvim you have a nerdfont in the terminal
vim.g.have_nerd_font = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line the cursor is on
vim.opt.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

