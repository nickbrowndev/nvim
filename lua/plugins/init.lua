-- [[ Install `lazy.nvim` plugin manager ]]
vim.pack.add({"https://github.com/folke/lazy.nvim"})

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update

require('lazy').setup({

    -- NOTE: Plugins can also be added by using a table,
    -- with the first argument being the link and the following
    -- keys can be used to configure plugin behavior/loading/etc.
    --
    -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.

   -- require 'plugins.lsp',
   -- require 'plugins.snacks',
   -- require 'plugins.blink',
   -- require 'plugins.persistence',
   require 'plugins.colorscheme',
   require 'plugins.which-key',
   require 'plugins.git',
   require 'plugins.treesitter',
   -- require 'plugins.mini',
   require 'plugins.harpoon',
    --require 'plugins.java',

    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

    }, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})

-- Additional local/pre-installed plugins. Needs to be after Lazy has finished.

-- Undotree
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>ut", "<cmd>Undotree<CR>", {desc = "Open undo tree panel"})
