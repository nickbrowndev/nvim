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
    -- Add this bit to default colourscheme
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'melange'
    end,
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
    lazy = true
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "nanotech/jellybeans.vim",
    lazy = true,
  },

}
