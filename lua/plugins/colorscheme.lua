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
        -- Add this bit to default colourscheme
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'kanagawa-dragon'
        end,
    },
    {
        "thesimonho/kanagawa-paper.nvim",
        name = 'kanagawa-paper',
        lazy = true,
    },
    {
        "webhooked/kanso.nvim",
        name = 'kanso',
        lazy = true,
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
        "zenbones-theme/zenbones.nvim",
        name = 'zenbones',
        lazy = true,
    },
}
