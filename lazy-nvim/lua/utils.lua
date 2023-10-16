local M = {}

--- Get highlight properties for a given highlight name
-- @param name highlight group name
-- @return table of highlight group properties
function M.get_hlgroup(name, fallback)
  if vim.fn.hlexists(name) == 1 then
    local hl
    if vim.api.nvim_get_hl then -- check for new neovim 0.9 API
      hl = vim.api.nvim_get_hl(0, { name = name, link = false })
      if not hl.fg then
        hl.fg = "NONE"
      end
      if not hl.bg then
        hl.bg = "NONE"
      end
    else
      hl = vim.api.nvim_get_hl_by_name(name, vim.o.termguicolors)
      if not hl.foreground then
        hl.foreground = "NONE"
      end
      if not hl.background then
        hl.background = "NONE"
      end
      hl.fg, hl.bg = hl.foreground, hl.background
      hl.ctermfg, hl.ctermbg = hl.fg, hl.bg
      hl.sp = hl.special
    end
    return hl
  end
  return fallback
end

return M
