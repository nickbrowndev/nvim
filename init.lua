require "keymaps"
require "settings"
require "autocommands"
if vim.g.neovide then
    -- List of alternate GUIs: https://github.com/neovim/neovim/wiki/Related-projects#gui
    require('neovide')
end
require "plugins"
