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
  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("neoscroll").setup()
  --   end,
  -- },
}
