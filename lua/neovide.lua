-- Settings for Neovide
-- Refer to https://neovide.dev/configuration.html

-- Control window transparency
vim.g.neovide_opacity = 0.9
-- Control window blurring
vim.g.neovide_window_blurred = true

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
-- Control how many lines are animated at the end of a scroll action
vim.g.neovide_scroll_animation_far_lines = 3 -- default 1

-- Hide mouse while typing
vim.g.neovide_hide_mouse_when_typing = true

-- Cursor customisation
-- More customisation options available

vim.g.neovide_cursor_antialiasing = true

-- Cursor Animation Length
vim.g.neovide_cursor_animation_length = 0.150
vim.g.neovide_cursor_short_animation_length = 0.04

vim.g.neovide_cursor_trail_size = 0.8
-- Set to 'railgun'
vim.g.neovide_cursor_vfx_mode = 'railgun'

-- Set all animations off
local disableAnimations = true
if disableAnimations then
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00
end

vim.keymap.set({ "n", "v" }, "<C-ScrollWheelUp>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
vim.keymap.set({ "n", "v" }, "<C-ScrollWheelDown>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
