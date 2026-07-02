local M = {}

local function git_branch()
  local branch = vim.b.gitsigns_head
  if not branch or branch == '' then return '' end

  -- Extract the real-time git status dictionary for this buffer
  local status = vim.b.gitsigns_status_dict
  local is_dirty = false

  if status then
    -- Check if there are any added, changed, or deleted lines in this file
    local has_added = (status.added and status.added > 0)
    local has_changed = (status.changed and status.changed > 0)
    local has_removed = (status.removed and status.removed > 0)

    if has_added or has_changed or has_removed then
      is_dirty = true
    end
  end

  -- Append a indicator if the file itself has uncommitted changes
  local icon = is_dirty and '  ' or '  '
  return icon .. branch .. ' '
end

local function smart_path()
  local path = vim.fn.expand('%:~:.') -- Get workspace-relative path
  if path == "" then return " [No Name] " end

  local win_width = vim.api.nvim_win_get_width(vim.g.statusline_winid or 0)

  -- Selectively truncate based on available split width
  if win_width < 60 then
    return " " .. vim.fn.pathshorten(path, 1) .. " " -- Sharp truncation: s/m/j/c/a/Main.java
  elseif win_width < 100 then
    return " " .. vim.fn.pathshorten(path, 3) .. " " -- Milder truncation: src/mai/jav/com/app/Main.java
  else
    return " " .. path .. " "                       -- Unchanged full path
  end
end

function M.setup()
  vim.opt.laststatus = 2

  _G.custom_statusline = function()
    -- Get the unique ID of the specific window Neovim is actively redrawing
    local rendering_win = vim.g.statusline_winid
    -- Get the ID of the window where your cursor currently sits
    local active_win = vim.api.nvim_get_current_win()
    
    -- If they match, this window has active editing focus
    local is_active = (rendering_win == active_win)

    if is_active then
      -- High-visibility active split setup
      return table.concat({
        '%#Cursor#',
        ' %{mode()} ',
        '%#PmenuSel#',
        git_branch(),
        '%#LineNr#',
        ' [%2n] ',
        '%=',
        smart_path(),
        '%h%m%r%w ',
        '%=',
        '%<',
        '%#CursorColumn#',
        ' %y ',
        ' %{&fileencoding?&fileencoding:&encoding}',
        '[%{&fileformat}] ',
        '%p%% ',
        '%l[%c]:%L ',
      })
    else
      -- Flat, zero-clutter layout for background windows
      return table.concat({
        '%#StatusLineNC#',
        ' INACTIVE ',
        ' [%2n] ',
        '%=',
        smart_path(),
        '%h%m%r%w ',
        '%=',
        ' %y ',
        '%l[%c]:%L ',
      })
    end
  end

  vim.opt.statusline = '%!v:lua.custom_statusline()'
end

return {
  dir = vim.fn.stdpath('config'),
  name = 'native_statusline',
  lazy = false,
  init = function()
    M.setup()
  end,
}
