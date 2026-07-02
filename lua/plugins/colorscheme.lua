return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = true
    },
    {
        -- See https://github.com/lifepillar/vim-gruvbox8/tree/neovim for optimised version?
        'morhetz/gruvbox',
        name = 'gruvbox',
        lazy = true
    },
    {
        'sainnhe/gruvbox-material',
        name = 'gruvbox-material',
        lazy = true
    },
    {
        'arcticicestudio/nord-vim',
        name = 'nord',
        lazy = true
    },
    {
        'EdenEast/nightfox.nvim',
        name = 'nightfox',
        lazy = true
    },
    {
        'hardhackerlabs/theme-vim',
        name = 'hardhacker',
        lazy = true
    },
    {
        'savq/melange-nvim',
        name = 'melange',
        lazy = true
    },
    {
        'AlexvZyl/nordic.nvim',
        name = 'nordic',
        lazy = true
    },
    {
        "mcauley-penney/techbase.nvim",
        name = "techbase",
        lazy = true,
    },
    {
        'sainnhe/everforest',
        name = 'everforest',
        lazy = true
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = true,
    },
    {
        "rebelot/kanagawa.nvim",
        name = 'kanagawa',
    lazy = true,
    },
    {
        "thesimonho/kanagawa-paper.nvim",
        name = 'kanagawa-paper',
        lazy = true,
    },
    {
        "webhooked/kanso.nvim",
        name = 'kanso',
        -- Add this bit to default colourscheme
        priority = 1000,
        init = function()
          vim.cmd.colorscheme 'kanso-zen'
        end,
        opts = {
            --keywordStyle = {italic = false},
            minimal = true,
            dimInactive = true,
        }
    },
    {
        "folke/tokyonight.nvim",
        name = 'tokyonight',
        lazy = true,
    },
    {
        "nanotech/jellybeans.vim",
        name = 'jellybeans',
        lazy = true,
    },
    {
        -- There are other iceberg themes also, e.g. https://github.com/cocopon/iceberg.vim
        "https://github.com/oahlen/iceberg.nvim",
        name = 'iceberg-oahlen',
        lazy = true,
    },
    {
        "cocopon/iceberg.vim",
        name = 'iceberg-cocopon',
        lazy =true,
    },
    {
        "e-ink-colorscheme/e-ink.nvim",
        lazy = true,
    },
    {
        "webhooked/kanso.nvim",
        lazy = true,
    }
}
