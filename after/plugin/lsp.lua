-- https://github.com/VonHeikemen/lsp-zero.nvim
-- Note: "you might not need LSPZero"
-- https://www.reddit.com/r/neovim/comments/102bicr/you_might_not_need_lspzero/

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Ensure the following LSPs are automatically installed
lsp.ensure_installed({
'tsserver', -- Javascript
'eslint', -- Javascript
'lua_ls', -- Lua
'cssls', -- CSS
'dockerls', -- Docker
--'groovyls', -- Groovy
'html', -- HTML
'jdtls', -- Java
'marksman', -- Markdown
'sqlls', -- SQL
'vimls', -- VimL
'lemminx', -- XML
'yamlls', -- YAML
 })

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
