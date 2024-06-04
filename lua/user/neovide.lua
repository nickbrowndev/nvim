-- Settings for Neovide
-- Refer to https://neovide.dev/configuration.html

-- Control window transparency
vim.g.neovide_transparency = 0.9
-- Control theme light/dark/auto
vim.g.neovide_theme = 'dark'

-- Control space between lines
vim.opt.linespace = 2

-- Padding around the editor
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 10
vim.g.neovide_padding_left = 10

-- Scrolling animations
vim.g.neovide_scroll_animation_length = 0.3

-- Hide mouse while typing
vim.g.neovide_hide_mouse_when_typing = true

-- Cursor customisation
-- More customisation options available
vim.g.neovide_cursor_trail_size = 0.8
-- Set to 'railgun'
vim.g.neovide_cursor_vfx_mode = "railgun"
