return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
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
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
