vim.lsp.enable('jdtls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    
    -- Only apply this to jdtls
    if client and client.name == 'jdtls' then
      local jdtls = require('jdtls')
      local opts = { buffer = args.buf, desc = "Java: " }
      
      -- Refactoring and Organization
      vim.keymap.set('n', '<leader>jo', jdtls.organize_imports, { buffer = args.buf, desc = "Organize Imports" })
      vim.keymap.set('n', '<leader>jv', jdtls.extract_variable, { buffer = args.buf, desc = "Extract Variable" })
      vim.keymap.set('v', '<leader>jm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], { buffer = args.buf, desc = "Extract Method" })
      
      -- Command to update the project configuration
      vim.api.nvim_buf_create_user_command(args.buf, "JdtUpdateConfig", jdtls.update_project_config, {})
    end
  end,
})
