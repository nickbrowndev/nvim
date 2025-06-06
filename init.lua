local hostname = vim.uv.os_gethostname()

vim.g.workspace = require("workspaces")

require "keymaps"
require "settings"
require "autocommands"
if vim.g.neovide then
    -- List of alternate GUIs: https://github.com/neovim/neovim/wiki/Related-projects#gui
    require 'neovide'
end
if enableLsp then
    require "lsp"
end
require "plugins"
