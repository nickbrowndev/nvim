local opt = vim.opt

-- File encodings
-- TODO

-- Colours & Fonts
--opt.guifont = {"Hack",":h10","Fira_Code",":h10","Consolas",":h10","Courier_New",":h10"}
opt.guifont = "Hack_Nerd_Font_Mono,Fira_Code,Consolas:h10" -- 'Fira_Code:h10','Consolas:h10','Courier_New:h10'"
opt.termguicolors = true    -- Enables 24 bit color in terminal
opt.background = "dark"

-- Tabs and indenting
opt.tabstop = 4             --
opt.softtabstop = 4         -- 
opt.shiftwidth = 4          -- Set shift width
opt.expandtab = true        -- Expand tabs to spaces
opt.smartindent = true      -- Use smart indenting
opt.wrap = false            -- Line wrapping
opt.list = true
-- ASCII list
-- opt.list = listchars=tab:>\ ,trail:-,eol:$,space:.
opt.listchars = "tab:\\u00BB ,eol:\\u00B6,space:\\u00B7,multispace:\\u00B7\\u00B7\\u00B7\\u25B9"
-- trail:,lead:,leadmultispace:,extends:,precedes:,conceal:,nbsp:,


-- UI Settings
-- opt.ruler = true -- TODO not sure this does anything
opt.number = true           -- Display current line number in gutter
opt.relativenumber = true   -- Display relative line numbers
opt.numberwidth = 5         -- Increase line number gutter size
opt.showmatch = true        -- Show matching brackets
opt.showmode = true         -- Show INSERT, REPLACE or VISUAL mode at bottom
opt.signcolumn = "yes"      -- Adds a column for file signs. Could use "number" instead. TODO investigate further
opt.colorcolumn = "120"     -- Sets a coloured column at the line index
opt.updatetime = 750        -- Delay before updating swap files
--opt.splitright = true       -- Add new horizontal splits on right
--opt.splitbelow = true       -- Add new vertical splits below
opt.cursorline = true

-- Navigation
opt.scrolloff = 5           -- Show x lines above or below cursor when scrolling
opt.sidescrolloff = 5       -- Keep x colums to the edge of the buffer

-- Seaching
--opt.path+=**
opt.ignorecase = true       -- turn off case sensitivity
opt.smartcase = true        -- smart case sensitive searching
opt.incsearch = true        -- search as characters are entered
opt.hlsearch = false        -- highlight search matches
--opt.complete+=kspell        -- Add dictionary to autocomplete when spelling enabled
opt.spell = false           -- 'set spell' sets the dictionary

-- Backup and Undo
opt.swapfile = false        -- 
opt.backup = false          -- Set file backups
-- TODO set this?
--opt.undodir = os.getenv("HOME") .. "/.undodir"  -- set the destination of the undo directory
opt.undofile = true         -- Saves undos to a file

-- Typing
opt.backspace = "indent,eol,start" -- Modify backspace behaviour
