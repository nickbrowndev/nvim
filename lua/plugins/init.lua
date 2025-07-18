-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

local proxyConfig = ''
if vim.g.proxy_required then
    proxyPath = 'http.proxy=' .. vim.g.proxy
    print ('Setting proxy ' .. vim.g.proxy)
	print (proxyPath)
else 
    print 'Skipped proxy setting'
end

if not (vim.uv or vim.loop).fs_stat(lazypath) then

  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  
  local cmd = { 'git', '-c', proxyPath, 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  local out = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require 'plugins.plugins'
