return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 33,
      },
    },
  },

  -- theme
  -- { "catppuccin/nvim", name = "catppuccin" },
  -- add dracula
  -- { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load theme
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "dracula",
  --   },
  -- },

  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handlers = {
          diagnostic = true,
          search = true, -- Requires hlslens to be loaded
        },
      })
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      -- require('hlslens').setup() is not required
      require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "filename" },
            { "branch" },
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            -- { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- {
            --   function()
            --     return require("nvim-navic").get_location()
            --   end,
            --   cond = function()
            --     return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            --   end,
            -- },
          },
          lualine_x = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = fg("Statement"),
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = fg("Constant"),
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            -- { "encoding" },
            { "fileformat" },
            { "filetype", icon_only = true },
            { "progress", separator = " ", padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            { "location", padding = { left = 0, right = 1 } },
          },
          -- lualine_z = {
          --   function()
          --     return " " .. os.date("%R")
          --   end,
          -- },
        },
        extensions = { "neo-tree" },
      }
    end,
  },
}
