-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--vim.cmd [[
    --augroup jdtls_lsp
        --autocmd!
        --autocmd FileType java lua require'config.java'.setup_jdtls()
    --augroup end
--]]
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  desc = 'Start Java LSP',
pattern = "*.java",
  group = vim.api.nvim_create_augroup('jdtls_lsp', { clear = true }),
  callback = function(args)
       print 'Starting Java LSP';
       require'plugins.java'.setup_jdtls() 
  end,
})
