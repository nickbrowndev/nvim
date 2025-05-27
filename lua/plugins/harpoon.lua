return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup()

        local extensions = require("harpoon.extensions");
        harpoon:extend(extensions.builtins.highlight_current_file())
        harpoon:extend(extensions.builtins.navigate_with_number());

        -- tabline_suffix = "   ",
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add Harpoon Mark" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Open Harpoon Menu" })

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

        -- basic telescope configuration
        -- local conf = require("telescope.config").values
        -- local function toggle_telescope(harpoon_files)
        --   local file_paths = {}
        --   for _, item in ipairs(harpoon_files.items) do
        --       table.insert(file_paths, item.value)
        --   end
        --
        --   require("telescope.pickers").new({}, {
        --       prompt_title = "Harpoon",
        --       finder = require("telescope.finders").new_table({
        --           results = file_paths,
        --       }),
        --       previewer = conf.file_previewer({}),
        --       sorter = conf.generic_sorter({}),
        --   }):find()
        -- end
        -- vim.keymap.set('n', '<leader>sp', function() toggle_telescope(require('harpoon'):list()) end, {desc = '[S]earch Har[p]oon Marks'})
    end,
}
