-- https://github.com/nvim-telescope/telescope.nvim 

local builtin = require('telescope.builtin')
-- All file search (originally <leader>ff)
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Git file search
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Ripgrep file search (not installed)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)	
