vim.g.mapleader = ' ' -- Set leader key
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local hostname = vim.uv.os_gethostname()

local isWindows = vim.fn.has("windows") > 0
local isLinux = vim.fn.has("linux") > 0

local osName
if isWindows then
    osName = "windows"
else
    osName = "linux"
end

vim.g.os = osName
vim.g.hostname = hostname

require "keymaps"
require "settings"
require "autocommands"

vim.g.workspace = require("workspaces")

--require "autocommands"
if (vim.g.neovide) then
    -- List of alternate GUIs: https://github.com/neovim/neovim/wiki/Related-projects#gui
    require 'neovide'
end
if vim.g.workspace.lsp_enabled == true then
    --require "lsp"
end
require "plugins"
