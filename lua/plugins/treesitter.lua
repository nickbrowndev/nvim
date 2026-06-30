return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = { 
      'bash', 'c', 'c_sharp', 'css', 'diff', 'html', 'java', 'javascript', 
      'json', 'lua', 'luadoc', 'markdown', 'markdown_inline', 
      'query', 'toml', 'vim', 'vimdoc', 'xml', 'yaml'
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
      require('nvim-treesitter').setup(opts)
  end,
}
