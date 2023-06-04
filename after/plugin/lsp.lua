-- https://github.com/VonHeikemen/lsp-zero.nvim
-- Note: "you might not need LSPZero"
-- https://www.reddit.com/r/neovim/comments/102bicr/you_might_not_need_lspzero/

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'tsserver', 'eslint'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
