-- LSP Plugins
return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- mason nvim dap ensures debug adapters are installed
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "java-debug-adapter", "java-test" }
      })
    end
  },
  {
    -- utility plugin for Java-specific features (refactoring, etc.)
    "mfussenegger/nvim-jdtls",
    dependencies = { "mfussenegger/nvim-dap" }
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      -- Neovim 0.11+ Native Enable: This reads from ~/.config/nvim/lsp/jdtls.lua
      vim.lsp.enable('jdtls')

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Standard Mappings
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- JAVA SPECIFIC HYBRID LOGIC
          if client and client.name == 'jdtls' then
            local jdtls = require('jdtls')
            
            -- Keymaps for nvim-jdtls features
            map('<leader>jo', jdtls.organize_imports, '[J]ava [O]rganize Imports')
            map('<leader>jv', jdtls.extract_variable, '[J]ava Extract [V]ariable')
            map('<leader>jc', jdtls.extract_constant, '[J]ava Extract [C]onstant')
            map('<leader>jt', jdtls.test_nearest_method, '[J]ava [T]est Nearest')
            map('<leader>jT', jdtls.test_class, '[J]ava [T]est Class')

            -- Link Debugger and Test Runner
            jdtls.setup_dap({ hotcodereplace = 'auto' })
            
            -- Optional: Format on save for Java
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = event.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
              end,
            })
          end

          -- Reference Highlighting Logic
          local function client_supports_method(c, method, bufnr)
            return c:supports_method(method, bufnr)
          end

          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Diagnostic UI setup
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      
      local servers = {
        lua_ls = {
          settings = {
            Lua = { completion = { callSnippet = 'Replace' } },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { 'stylua', 'jdtls' })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            -- BYPASS: Don't let mason-lspconfig call .setup() on jdtls
            -- This prevents it from conflicting with our native 0.11 enable
            if server_name == "jdtls" then return end

            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  }
}
