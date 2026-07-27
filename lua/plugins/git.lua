return {
  {
    'tpope/vim-fugitive',
    cmd = { "G", "Git" } -- Lazy load Fugitive until you run a Git command
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" }, -- Load only when opening a file
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation through hunks
        map('n', ']c', function()
          if vim.wo.diff then vim.cmd.normal({']c', bang = true}) else gitsigns.nav_hunk('next') end
        end, { desc = 'Next Git Hunk' })

        map('n', '[c', function()
          if vim.wo.diff then vim.cmd.normal({'[c', bang = true}) else gitsigns.nav_hunk('prev') end
        end, { desc = 'Previous Git Hunk' })

        -- Actions tied directly to your which-key <leader>h group
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = '[S]tage Hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = '[R]eset Hunk' })
        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage Selected Hunk' })
        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset Selected Hunk' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = '[P]review Hunk' })
        map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { desc = '[B]lame Line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = '[D]iff This File' })
      end
    },
  },
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      -- Only one of these is needed.
      "sindrets/diffview.nvim",        -- optional
      --"esmuellert/codediff.nvim",      -- optional

      -- For a custom log pager
      "m00qek/baleia.nvim",            -- optional

      -- Only one of these is needed.
      -- "nvim-telescope/telescope.nvim", -- optional
      --"ibhagwan/fzf-lua",              -- optional
      --"nvim-mini/mini.pick",           -- optional
        "folke/snacks.nvim",             -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    }
  }
}
