return {
  {
    "mg979/vim-visual-multi",
  },
  {
    "jxnblk/vim-mdx-js",
  },
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<C-w>", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      local hop = require("hop")
      hop.setup({ keys = "etovxqpdygfblzhckisuran" })
      local directions = require("hop.hint").HintDirection
      vim.keymap.set("", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set("", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set("", "t", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set("", "T", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
      vim.keymap.set("", "<leader><leader>", function()
        hop.hint_words()
      end, { remap = true, desc = "Hop" })
    end,
  },
  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("neoscroll").setup()
  --   end,
  -- },
}
