return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- local cmp_kinds = {
      --   Text = "  ",
      --   Method = "  ",
      --   Function = "  ",
      --   Constructor = "  ",
      --   Field = "  ",
      --   Variable = "  ",
      --   Class = "  ",
      --   Interface = "  ",
      --   Module = "  ",
      --   Property = "  ",
      --   Unit = "  ",
      --   Value = "  ",
      --   Enum = "  ",
      --   Keyword = "  ",
      --   Snippet = "  ",
      --   Color = "  ",
      --   File = "  ",
      --   Reference = "  ",
      --   Folder = "  ",
      --   EnumMember = "  ",
      --   Constant = "  ",
      --   Struct = "  ",
      --   Event = "  ",
      --   Operator = "  ",
      --   TypeParameter = "  ",
      -- }

      local function border(hl_name)
        return {
          { "╭", hl_name },
          { "─", hl_name },
          { "╮", hl_name },
          { "│", hl_name },
          { "╯", hl_name },
          { "─", hl_name },
          { "╰", hl_name },
          { "│", hl_name },
        }
      end
      opts.window = {
        completion = {
          border = border("CmpBorder"),
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          border = border("CmpDocBorder"),
        },
      }
    end,
  },
}
