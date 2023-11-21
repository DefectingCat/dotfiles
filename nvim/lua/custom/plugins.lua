local cmp = require "cmp"

local plugins = {
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.git.diffview" },
    { import = "nvcommunity.git.lazygit" },
    { import = "nvcommunity.lsp.prettyhover" },
    { import = "nvcommunity.lsp.mason-lspconfig" },
  },

  -- LSP, formatter, linter
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        -- rust
        "rust-analyzer",
        "taplo", -- toml formatter
        -- javascript
        "html-lsp",
        "prettierd",
        "xmlformatter", -- xml svg formatter
        "vue-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        -- docker
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hadolint", -- dockerfile linter
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "markdown",
        "markdown_inline",
        "jsdoc",

        -- low level
        "rust",
        "toml",
        "go",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }
      table.insert(M.sources, { name = "crates" })
      -- cmp window
      -- local function border(hl_name)
      --   return {
      --     { "╭", hl_name },
      --     { "─", hl_name },
      --     { "╮", hl_name },
      --     { "│", hl_name },
      --     { "╯", hl_name },
      --     { "─", hl_name },
      --     { "╰", hl_name },
      --     { "│", hl_name },
      --   }
      -- end
      -- M.window = {
      --   completion = {
      --     border = border "CmpBorder",
      --     winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      --   },
      --   documentation = {
      --     border = border "CmpDocBorder",
      --   },
      -- }
      -- original LazyVim kind icon formatter
      local format_kinds = M.formatting.format
      M.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
      return M
    end,
  },
  -- rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
      require("core.utils").load_mappings "crates"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- debug
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- motion, UI and others
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      local hop = require "hop"
      hop.setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  -- {
  --   "mg979/vim-visual-multi",
  -- },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  {
    "jxnblk/vim-mdx-js",
  },
  {
    "windwp/nvim-autopairs",
  },
  {
    "windwp/nvim-ts-autotag",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  -- comment string
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil
        if ctx.ctype == U.ctype.block then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
          key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
          location = location,
        }
      end,
    },
  },
  -- term
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup {
        terminals = {
          type_opts = {
            float = {
              relative = "editor",
              row = 0.1,
              col = 0.1,
              width = 0.8,
              height = 0.8,
              border = "single",
            },
          },
        },
      }
    end,
  },
  -- ui
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- git
  {
    "sindrets/diffview.nvim",
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       lua = { "stylua" },
  --       -- Conform will run multiple formatters sequentially
  --       python = { "isort", "black" },
  --       -- Use a sub-list to run only the first available formatter
  --       javascript = { { "prettierd", "prettier" } },
  --     },
  --   },
  -- },
}

return plugins
