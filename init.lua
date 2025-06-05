local hostname = vim.uv.os_gethostname()

if (hostname == "UK05CG2089J5Y") then
    vim.g.proxy_required = true
    vim.g.proxy = "http://proxy-zs3.global.lmco.com:80"
elseif (hostname == "WAROWDA-TSS01") then
    vim.g.proxy_required = true
    vim.g.proxy = "http://proxy-zs3.global.lmco.com:80"
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
