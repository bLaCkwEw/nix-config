-- Set CTRL+s to write to the file
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Terminal
vim.keymap.set('n', '<leader>t', ':terminal<CR>', { noremap = true, silent = true })

-- Move lines with alt UP/DOWN or K/J
-- Helper function --- WIP
--[[ local function move_lines(direction)
	local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")
	local cmd
	if direction == 'up' then
		if start_line == 1 then
			print("Already at top of buffer")
			return
		end
		cmd = "m '<-2"
	elseif direction == 'down' then
		if end_line == vim.fn.line('$') then
			print("Already at bottom of buffer")
			return
		end
		cmd = "m '>+1"
	end

	vim.cmd(":'<,'>" .. cmd)
	vim.cmd("normal! gv=gv")
end ]]


-- Normal Mode
vim.keymap.set('n', '<A-Up>', ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', ":m .+1<CR>==", { noremap = true, silent = true })
-- Visual Mode
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
