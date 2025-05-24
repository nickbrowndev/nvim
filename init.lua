local hostname = vim.uv.os_gethostname()

if (hostname == "abc123") then
    vim.g.proxy_required = true
    vim.g.proxy = "my proxy here"
else
    vim.g.proxy_required = false
end

require "keymaps"
require "settings"
require "autocommands"
if vim.g.neovide then
    -- List of alternate GUIs: https://github.com/neovim/neovim/wiki/Related-projects#gui
    require('neovide')
end
require "lsp"
require "plugins"
