return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true
  },
  {
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
}
