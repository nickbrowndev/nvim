local hostname = vim.uv.os_gethostname()

local enableLsp = false
local workspaces = {}
if (hostname == "UK05CG2089J5Y") then -- Work laptop
    vim.g.proxy_required = false
    -- vim.g.proxy = "proxy-zs3.global.lmco.com:80"
    local repoDir = "C:\\Users\\e314680\\repo\\james"
    workspaces["JAMES"] = {name = "JAMES", key = "j", location = repoDir .. "\\james_dev"}
    workspaces["JAMES App"] = {name = "JAMES App", key = "a", location = repoDir .. "\\james_dev\\Application"}
    workspaces["DMI"] = {name = "DMI", key = "d", location = repoDir .. "\\james_dev\\Deployed_Mgmt_Interface\\Application"}
elseif (hostname == "WAROWDA-TSS01") then -- Work VM
    vim.g.proxy_required = true
    vim.g.proxy = "http://proxy-zs3.global.lmco.com:80"
    local repoDir = "C:\\Users\\nick\\repo\\james"
    workspaces["JAMES"] = {name = "JAMES", key = "j", location = repoDir .. "\\james_dev"}
    workspaces["JAMES App"] = {name = "JAMES App", key = "a", location = repoDir .. "\\james_dev\\Application"}
    workspaces["DMI"] = {name = "DMI", key = "d", location = repoDir .. "\\james_dev\\Deployed_Mgmt_Interface\\Application"}
else
    vim.g.proxy_required = false
    enableLsp = true
end

vim.g.workspaces = workspaces

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
