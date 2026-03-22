--vim.lsp.enable('jdtls')

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

-- TODO use this instead?
--local jdtls = require('jdtls')
--
--vim.api.nvim_create_autocmd('FileType', {
--  pattern = 'java',
--  callback = function(args)
--    -- 1. Import your project/JVM data from /lsp/jdtls.lua
--    local config = require('lsp.jdtls')
--
--    -- 2. Dynamically find the Debugger & Test bundles (GitHub recommendation)
--    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/"
--    local bundles = {
--      vim.fn.glob(mason_path .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
--    }
--
--    -- Find and add all java-test server jars
--    local test_jars = vim.fn.glob(mason_path .. "java-test/extension/server/*.jar", true)
--    if test_jars ~= "" then
--      vim.list_extend(bundles, vim.split(test_jars, "\n"))
--    end
--
--    -- 3. Inject bundles into the config table (Must be in init_options)
--    config.init_options.bundles = bundles
--
--    -- 4. Define what happens when the LSP attaches to a buffer
--    config.on_attach = function(client, bufnr)
--      -- Initialize the Debugger and Test bridge
--      jdtls.setup_dap({
--            hotcodereplace = 'auto',
--            config_overrides = {}
--      })
--      require('jdtls.dap').setup_dap_main_class_configs()
--
--      -- Helper for setting keymaps
--      local map = function(mode, lhs, rhs, desc)
--        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
--      end
--
--      -- JDTLS Specific Actions
--      map('n', '<leader>jo', jdtls.organize_imports, "Java: Organize Imports")
--      map('n', '<leader>jv', jdtls.extract_variable, "Java: Extract Variable")
--      map('v', '<leader>jm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], "Java: Extract Method")
--
--      -- Testing & Debugging
--      map('n', '<leader>df', jdtls.test_class, "Java: Debug Test Class")
--      map('n', '<leader>dn', jdtls.test_nearest_method, "Java: Debug Nearest Method")
--
--      -- Generic DAP keymaps (Works for all languages)
--      local dap = require('dap')
--      map('n', '<F5>', dap.continue, "Debug: Start/Continue")
--      map('n', '<leader>b', dap.toggle_breakpoint, "Debug: Toggle Breakpoint")
--      map('n', '<F10>', dap.step_over, "Debug: Step Over")
--    end
--
--    -- 5. Final Command: Start or Attach the server
--    jdtls.start_or_attach(config)
--  end,
--})
