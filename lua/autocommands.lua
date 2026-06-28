-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Prevent comment automatically continuing on next line
local format_options_group = augroup('FormatOptions', { clear = true })
autocmd('BufEnter', {
    group = format_options_group,
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
    desc = 'Prevent comment from automatically continuing on the next line',
})

-- Restore last cursor position when reopening a file
local last_cursor_group = augroup("LastCursorGroup", { clear = true })
autocmd("BufReadPost", {
    group = last_cursor_group,
    callback = function()
        if vim.o.diff then -- except in diff mode
            return
        end

        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
    desc = 'Restore last cursor position on file read',
})

-- Highlight the yanked text
local highlight_yank_group = augroup("HighlightYank", { clear = true })
autocmd("TextYankPost", {
    group = highlight_yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 200, -- Keeps the flash snappy at 200ms
        })
    end,
    desc = 'Flashes a highlight over newly yanked text',
})

local qf_group = vim.api.nvim_create_augroup("QuickfixAutomation", { clear = true })

-- Automatically open quickfix window when a command populates it
vim.api.nvim_create_autocmd("QuickfixCmdPost", {
    group = qf_group,
    pattern = "[^l]*",
    command = "cwindow",
    desc = "Open quickfix window automatically on relevant commands",
})

-- Automatically close Neovim if the only window left open is the quickfix window
local sidebar_cleanup_group = vim.api.nvim_create_augroup("SidebarCleanup", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    group = sidebar_cleanup_group,
    callback = function()
        -- Only proceed if this is the last window in the current tab
        if #vim.api.nvim_tabpage_list_wins(0) > 1 then
            return
        end

        local buftype = vim.bo.buftype
        local filetype = vim.bo.filetype

        -- List of buffer types or filetypes that shouldn't keep the editor open
        local sidebar_types = {
            quickfix = true,
            help = true,
            terminal = true,
        }

        local sidebar_filetypes = {
            ["neo-tree"] = true,
            ["nvim-tree"] = true,
            undotree = true,
            diff = true,
            fugitive = true,
        }

        if sidebar_types[buftype] or sidebar_filetypes[filetype] then
            -- Use a delayed schedule to allow smooth cleanup without racing UI hooks
            vim.schedule(function()
                -- Double check we are still in a single window state before quitting
                if #vim.api.nvim_tabpage_list_wins(0) == 1 then
                    vim.cmd("quit")
                end
            end)
        end
    end,
    desc = "Automatically quit Neovim if the only remaining window is a sidebar or utility panel",
})

local term_group = vim.api.nvim_create_augroup("TerminalSettings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    group = term_group,
    pattern = "*",
    callback = function()
        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.cmd("startinsert")
    end,
    desc = "Configure clean defaults and auto-insert for built-in terminal mode",
})

-- Toggle relative line numbers when in insert mode
local number_group = vim.api.nvim_create_augroup("ToggleRelativeNumbers", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
    group = number_group,
    pattern = "*",
    callback = function()
        if vim.wo.nu and vim.api.nvim_get_mode().mode ~= "i" then
            vim.wo.relativenumber = true
        end
    end,
    desc = "Enable relative numbers when window is active or in normal mode",
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
    group = number_group,
    pattern = "*",
    callback = function()
        if vim.wo.nu then
            vim.wo.relativenumber = false
        end
    end,
    desc = "Disable relative numbers when window loses focus or enters insert mode",
})
