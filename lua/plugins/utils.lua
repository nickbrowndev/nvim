-- https://github.com/folke/which-key.nvim
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            lazy = true,
        },
    },
    {
        'ThePrimeagen/harpoon'
    },
    {
        'tpope/vim-surround'
    },
    {
        'mbbill/undotree'
    },
    -- Multiple project management
    -- see https://alpha2phi.medium.com/vim-neovim-managing-multiple-projects-63180fc87188 
    -- https://github.com/airblade/vim-rooter
    -- or
    -- https://github.com/nvim-telescope/telescope-project.nvim
}
