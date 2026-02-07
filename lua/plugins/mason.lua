return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = {
                    -- needs external plugins
                  --"jdtls"
                }
            }
        }   
    },
   -- {
   --     "mfussenegger/nvim-jdtls" 
   -- }

}
