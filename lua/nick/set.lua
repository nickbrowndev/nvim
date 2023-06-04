

-- File encodings
-- TODO

-- Colours & Fonts
--vim.opt.guifont = {"Hack",":h10","Fira_Code",":h10","Consolas",":h10","Courier_New",":h10"}
vim.opt.guifont = "Hack Nerd Font Mono" --:h14,Hack:h18,Fira_Code:h10,Consolas:h10,Courier_New:h10"
vim.opt.termguicolors = true    -- Enables 24 bit color in terminal

-- Tabs and indenting
vim.opt.tabstop = 4             --
vim.opt.softtabstop = 4         -- 
vim.opt.shiftwidth = 4          -- Set shift width
vim.opt.expandtab = true        -- Expand tabs to spaces
vim.opt.smartindent = true      -- Use smart indenting
vim.opt.wrap = false            -- Line wrapping

-- UI Settings
-- vim.opt.ruler = true -- TODO not sure this does anything
vim.opt.number = true           -- Display current line number in gutter
vim.opt.relativenumber = true   -- Display relative line numbers
vim.opt.numberwidth = 5         -- Increase line number gutter size
vim.opt.showmatch = true        -- Show matching brackets
vim.opt.showmode = true         -- Show INSERT, REPLACE or VISUAL mode at bottom
vim.opt.signcolumn = "yes"      -- Adds a column for file signs. Could use "number" instead. TODO investigate further
vim.opt.colorcolumn = "120"     -- Sets a coloured column at the line index
vim.opt.updatetime = 750        -- Delay before updating swap files

-- Navigation
vim.opt.scrolloff = 5           -- Show x lines above or below cursor when scrolling

-- Seaching
--vim.opt.path+=**
vim.opt.ignorecase = true       -- turn off case sensitivity
vim.opt.incsearch = true        -- search as characters are entered
vim.opt.hlsearch = false        -- highlight search matches
--vim.opt.complete+=kspell        -- Add dictionary to autocomplete when spelling enabled
vim.opt.spell = false           -- 'set spell' sets the dictionary

-- Backup and Undo
vim.opt.swapfile = false        -- 
vim.opt.backup = false          -- Set file backups
-- TODO set this?
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- set the destination of the undo directory
vim.opt.undofile = true         -- Saves undos to a file
