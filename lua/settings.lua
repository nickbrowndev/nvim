local opt = vim.opt

-- File encodings
-- TODO

-- Colours & Fonts
vim.g.have_nerd_font = true
opt.guifont = "Hack Nerd Font Mono:h10"
-- opt.guifont = "FiraMono Nerd Font:h12"
-- opt.guifont = "CommitMonoLight,Hack Nerd Font Mono:h10"
-- opt.guifont = "CommitMonoLight:h11"
-- opt.guifont = "Cascadia Code:h12" -- Add fallback nerd font?
-- opt.guifont = "Consolas:h12" -- Add fallback nerd font?
-- opt.guifont = "Courier New:h12" -- Add fallback nerd font?
-- Other fonts to try:
--  Monaspace neon
--  Berkeley Mono
--  Source Code Pro
--  Fragment mono
opt.termguicolors = true -- Enables 24 bit color in terminal
opt.background = "dark"

-- Tabs and indenting
opt.tabstop = 4        --
opt.softtabstop = 4    --
opt.shiftwidth = 4     -- Set shift width
opt.expandtab = true   -- Expand tabs to spaces
opt.smartindent = true -- Use smart indenting
opt.wrap = false       -- Line wrapping (default: true)
opt.linebreak = true   -- Don't split words (default: false)
opt.list = true
-- ASCII list
opt.list = true
opt.listchars = "tab:\\u00BB\\u0020,space:\\u00B7,nbsp:\\u2423,leadmultispace:\\u00B7\\u00B7\\u00B7\\u25B9"
-- Additional: eol:\\u00B6,trail:,lead:,multispace:,extends:,precedes:,conceal:,

-- Mouse
opt.mouse = 'a' -- Enable mouse mode (helpful for resizing splits etc)

-- UI Settings
-- opt.ruler = true -- TODO not sure this does anything
opt.number = true           -- Display current line number in gutter
opt.relativenumber = true   -- Display relative line numbers
opt.numberwidth = 5         -- Increase line number gutter size
opt.showmatch = true        -- Show matching brackets
opt.showmode = false        -- Show INSERT, REPLACE or VISUAL mode at bottom. Use status line instead
opt.signcolumn = "yes"      -- Adds a column for file signs. Could use "number" instead. TODO investigate further
opt.colorcolumn = "120"     -- Sets a coloured column at the line index
opt.updatetime = 750        -- Delay before updating swap files
opt.splitright = true       -- Add new horizontal splits on right
opt.splitbelow = true       -- Add new vertical splits below
opt.cursorline = true
opt.breakindent = true      -- Auto-indent after forced line break
opt.timeoutlen = 300        -- Adjust timeout after key combination
opt.inccommand = 'split'    -- Preview substitutions live, as you type!
opt.confirm = true          -- Raise a confirm dialog to when you have unsaved changes
vim.o.winborder = "rounded" -- Enable rounded borders in floating windows

-- Navigation
opt.scrolloff = 5     -- Show x lines above or below cursor when scrolling
opt.sidescrolloff = 5 -- Keep x colums to the edge of the buffer

-- Clipboard

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Seaching
--opt.path+=**
opt.ignorecase = true -- turn off case sensitivity
opt.smartcase = true  -- smart case sensitive searching
opt.incsearch = true  -- search as characters are entered
opt.hlsearch = false  -- highlight search matches
--opt.complete+=kspell        -- Add dictionary to autocomplete when spelling enabled
opt.spell = false     -- 'set spell' sets the dictionary

-- Backup and Undo
opt.swapfile = false -- Creates a swapfile (default: true)
opt.updatetime = 250 -- decrease swapfile save delay
opt.backup = false   -- Set file backups
-- TODO set this?
--opt.undodir = os.getenv("HOME") .. "/.undodir"  -- set the destination of the undo directory
opt.undofile = true -- Saves undos to a file

-- Typing
opt.backspace = "indent,eol,start" -- Modify backspace behaviour



-- Autocommands

-- Toggle Relative Line Number 
local linenumber = vim.api.nvim_create_augroup('linenumber', {clear = true})
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
    group = linenumber,
    callback = function() if (vim.opt.number:get() == true and vim.fn.mode() ~= "i"
    ) then vim.opt.relativenumber = true end end,
    desc = "Turns on relative line number when appropriate"
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
    group = linenumber,
    callback = function() vim.opt.relativenumber = false end,
    desc = "Turns off relative line number when appropriate"
})
