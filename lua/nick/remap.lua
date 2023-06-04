-- From:
--  - https://www.youtube.com/watch?v=w7i4amO_zaE
--  - https://www.youtube.com/watch?v=435-amtVYJ8

vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "                                   -- Set leader key

-- Modes
--   "n" normal mode
--   "i" insert mode
--   "v" visual mode
--   "x" visual block mode
--   "t" term mode
--   "c" command mode

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)           -- Open file tree

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")            -- Highlighted text move up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")            -- '' 

vim.keymap.set("n", "J", "mzJ`z")                       -- Keep cursor in place when appending lines

vim.keymap.set("n", "<C-d>", "<C-d>zz")                 -- Keep cursor in middle when moving up/down half a page
vim.keymap.set("n", "<C-u>", "<C-u>zz")                 -- ''
vim.keymap.set("n", "J", "mzJ`z")                       -- Keep cursor in place when appending lines
vim.keymap.set("n", "n", "nzzzv")                       -- Keep cursor in middle of screen when searching
vim.keymap.set("n", "N", "Nzzzv")                       -- ''

-- vim.keymap.set("n", "<C-h>", "<C-w>h")                  -- Easier Window movement
-- vim.keymap.set("n", "<C-j>", "<C-w>j")                  -- ''
-- vim.keymap.set("n", "<C-k>", "<C-w>k")                  -- ''
-- vim.keymap.set("n", "<C-l>", "<C-w>l")                  -- ''

vim.keymap.set("x", "<leader>p", "\"_dP")               -- Retain pasted text in the temporary buffer when overwriting. May not be needed - Shift P apparently does same thing

vim.keymap.set("n", "<leader>y", "\"+y")                -- Copy to system clipboard register
vim.keymap.set("v", "<leader>y", "\"+y")                -- '' 
vim.keymap.set("n", "<leader>Y", "\"+Y")                -- ''

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- Open TMUX sessions
-- 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")        -- Quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")        -- ''
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")    -- ''
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")    -- ''

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Start custom search for current word
