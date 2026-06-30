return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        local jdtls = require('jdtls')
        local mason_path = vim.fn.stdpath("data") .. "/mason/packages/"
        
        -- Dynamically isolate workspace paths by project root name
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = vim.fn.stdpath("data") .. "/site/java-workspaces/" .. project_name

        -- Resolve capabilities through your blink completion engine
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local config = {
          cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.level=ALL",
            "-Xmx1G",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "--add-opens", "java.util=ALL-UNNAMED",
            "-jar", vim.fn.glob(mason_path .. "jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
            "-configuration", mason_path .. "jdtls/config_linux",
            "-data", workspace_dir,
          },
          root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
          capabilities = capabilities,
          settings = {
            java = {
              signatureHelp = { enabled = true },
              contentProvider = { preferred = 'fernflower' },
            },
          },
        }

        -- Dynamic Debugger & Test bundle loading
        local bundles = {
          vim.fn.glob(mason_path .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true),
        }

        local test_jars = vim.fn.glob(mason_path .. "java-test/extension/server/*.jar", true)
        if test_jars ~= "" then
          vim.list_extend(bundles, vim.split(test_jars, "\n"))
        end

        config.init_options = { bundles = bundles }

        config.on_attach = function(client, bufnr)
          -- Helper function for buffer-local mapping
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "Java: " .. desc })
          end

          -- 1. Refactoring & Structural Code Modification
          map('n', '<leader>jo', jdtls.organize_imports, "Organize Imports")
          map('n', '<leader>jv', jdtls.extract_variable, "Extract Variable")
          map('v', '<leader>jm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], "Extract Method")
          map('n', '<leader>jc', jdtls.extract_constant, "Extract Constant")

          -- 2. Compilation & Unit Testing (Requires java-test bundle)
          map('n', '<leader>jt', jdtls.test_nearest_method, "Test Nearest Method")
          map('n', '<leader>jT', jdtls.test_class, "Test Class")
          
          -- 3. Debugger Initialization (Requires java-debug bundle)
          jdtls.setup_dap({ hotcodereplace = 'auto' })
        end

        jdtls.start_or_attach(config)
      end,
    })
  end
}
