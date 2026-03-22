-- From:
--  - https://www.youtube.com/watch?v=w7i4amO_zaE
--  - https://www.youtube.com/watch?v=435-amtVYJ8
--  - https://www.youtube.com/watch?v=KYDG3AHgYEs
--  - https://www.youtube.com/watch?v=lljs_7xB7Ps 

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' ' -- Set leader key
vim.g.maplocalleader = ' '

-- Modes
--   "n" normal mode
--   "i" insert mode
--   "v" visual mode (visual and select mode, :h Select-mode-mapping)
--   "x" visual non-select mode
--   "s" visual select only mode
--   "t" terminal mode
--   "c" command mode

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- Exit builtin terminal more easily


vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to the left window' })  -- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to the right window' }) --  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to the upper window' })
vim.keymap.set('n', '<leader>sv', ":vsplit<CR>", {desc = "Split window vertically"})
vim.keymap.set('n', '<leader>sh', ":split<CR>", {desc = "Split window horizontally"})
vim.keymap.set('n', '<C-Up>', ":resize +2<CR>", {desc = "Increase Window Height"})
vim.keymap.set('n', '<C-Down>', ":resize -2<CR>", {desc = "Decrease Window Height"})
vim.keymap.set('n', '<C-Left>', ":vertical resize -2<CR>", {desc = "Decrease Window Height"})
vim.keymap.set('n', '<C-Right>', ":vertical resize +2<cr>", {desc = "Increase Window Height"})

-- Buffer Operations
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>')     -- Save file
vim.keymap.set('n', '<Tab>', ':bnext<CR>')       -- Move to next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>') -- Move to next buffer

-- Editing
vim.keymap.set("n", "j", function()
    return vim.v.count == 0 and "gj" or "j"
end, {expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
    return vim.v.count == 0 and "gk" or "k"
end, {expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")                                     -- Move highlighted text up/down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")                                     -- ''

vim.keymap.set('n', '<C-d>', '<C-d>zz')                                          -- Keep cursor in middle when moving up/down half a page
vim.keymap.set('n', '<C-u>', '<C-u>zz')                                          -- ''
vim.keymap.set('n', 'J', 'mzJ`z')                                                -- Keep cursor in place when appending lines
vim.keymap.set('n', 'n', 'nzzzv')                                                -- Keep cursor in middle of screen when searching
vim.keymap.set('n', 'N', 'Nzzzv')                                                -- ''

vim.keymap.set('n', 'x', '"_x')                                                  -- Prevent single character deletion affecting register
vim.keymap.set('n', 'X', '"_X')                                                  -- Prevent single character deletion affecting register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = '[P]aste (retaining value)' }) -- Retain pasted text in the temporary buffer when overwriting. May not be needed - Shift P apparently does same thing
vim.keymap.set({'n', 'v'}, "<leader>x", '"_d', {desc = "Delete without yanking"})
vim.keymap.set({ 'n', 'v'}, '<leader>y', '"+y', { desc = '[Y]ank word to clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank line to clipboard' })

-- Retain Highlight When Indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace Word' }) -- Start custom search for current word

vim.keymap.set('n', '<leader>cd.', function() vim.cmd('cd ' .. vim.fn.expand '%:p:h') end,
    { desc = 'cd to directory of buffer.' })
vim.keymap.set('n', '<leader>cdn', function() vim.cmd('cd ' .. vim.fn.stdpath('config')) end,
    { desc = 'cd to Neovim config directory' })
vim.keymap.set('n', "<leader>pa", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file:", path)
end, {desc = "Copy full file [pa]th"})

vim.keymap.set('n', "<leader>td", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, {desc = "[T]oggle [d]iagnostics"})

local locations = vim.g.workspace['locations']

if (locations ~= nil and locations ~= '') then
	for key, value in pairs(locations) do
	    vim.keymap.set('n', '<leader>cd' .. value.key, function() vim.cmd('cd ' .. value.location) end,
		{ desc = 'cd to ' .. key .. ' directory' })
	end
end

local commands = vim.g.workspace["commands"]

if (commands ~= nil and commands ~= '') then
	for key, value in pairs(vim.g.workspace["commands"]) do
	    vim.keymap.set('n', '<leader>cm' .. value.key, function() vim.cmd(value.cmd) end,
		{ desc = 'Run ' .. key})
	end
end

-- #########################

--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, {desc == 'Open File Tree'} ) -- Open file tree
--vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>') -- Open TMUX sessions
--
-- Replaced by [q ]q [l ]l
-- vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')                                      -- Quickfix navigation
-- vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')                                      -- ''
-- vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next Quickfix Item' }) -- ''
-- vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Prev Quickfix Item' }) -- ''
