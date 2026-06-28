return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- Lazy-load the plugin entirely based on these key events
  keys = {
    { "<leader>a", function() require("harpoon"):list():add() end, desc = "Add Harpoon Mark" },
    { "<C-e>", function() local h = require("harpoon") h.ui:toggle_quick_menu(h:list()) end, desc = "Open Harpoon Menu" },
    { "<C-h>", function() require("harpoon"):list():select(1) end, desc = "Harpoon File 1" },
    { "<C-t>", function() require("harpoon"):list():select(2) end, desc = "Harpoon File 2" },
    { "<C-n>", function() require("harpoon"):list():select(3) end, desc = "Harpoon File 3" },
    { "<C-s>", function() require("harpoon"):list():select(4) end, desc = "Harpoon File 4" },
    { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = "Harpoon Previous Buffer" },
    { "<C-S-N>", function() require("harpoon"):list():next() end, desc = "Harpoon Next Buffer" },
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    -- Load runtime layout and active line tracking modules
    local extensions = require("harpoon.extensions")
    harpoon:extend(extensions.builtins.highlight_current_file())
    harpoon:extend(extensions.builtins.navigate_with_number())
  end,
}
