local M = {}

local cc_bg = vim.api.nvim_get_hl(0, { name = "CursorColumn" }).bg
local err_fg = vim.api.nvim_get_hl(0, { name = "DiagnosticError" }).fg
local warn_fg = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" }).fg

-- Set custom statusline diagnostic groups with matching background
vim.api.nvim_set_hl(0, "StatusLineLspError", { fg = err_fg, bg = cc_bg, bold = true })
vim.api.nvim_set_hl(0, "StatusLineLspWarn", { fg = warn_fg, bg = cc_bg, bold = true })

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
  local winid = vim.g.statusline_winid or 0
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local path = vim.fn.expand('#' .. bufnr .. ':~:.') -- Get workspace-relative path
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

local function get_lsp_data(winid)
  winid = winid or vim.g.statusline_winid or 0
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if #clients == 0 then
    return nil
  end

  local clientNames = vim.iter(clients)
    :map(function(client) return client.name end)
    :join(", ")
  
  local diagnosticCounts = vim.diagnostic.count(bufnr)

  return {
    client_name = clientNames,
    errors = diagnosticCounts[vim.diagnostic.severity.ERROR] or 0,
    warnings = diagnosticCounts[vim.diagnostic.severity.WARN] or 0
  }
end

-- Formatter returning a string for statusline evaluation
local function format_lsp_status(data, defaultHighlightGroup)
  if not data then return "" end
  defaultHighlightGroup = defaultHighlightGroup or "%*"



  local parts = { data.client_name }

  if data.errors > 0 then table.insert(parts, "%#StatusLineLspError#E:" .. data.errors .. defaultHighlightGroup) end
  if data.warnings > 0 then table.insert(parts, "%#StatusLineLspWarn#W:" .. data.warnings .. defaultHighlightGroup) end

  return "[" .. table.concat(parts, " ") .. "]"
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

      local lspdata = get_lsp_data()
      local lspDataOutput = format_lsp_status(lspdata, "%#CursorColumn#")

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
        lspDataOutput,
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
