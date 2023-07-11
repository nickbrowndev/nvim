-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup({
    sections = {
        -- sections 'a','b','c' and 'x','y','z'
        lualine_a = {'mode'},--, fmt = function(str) return str:sub(1,1) end }},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'%2n', {'filename', path =2}}, -- 1 = path relative to project, 2 = absolute path
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'%l[%c]:%L'}             -- LineNumber[Column]:TotalLines
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'[%2n]'},
        lualine_c = {{'filename', path = 2}},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'%l[%c]:%L'},

    }

})
