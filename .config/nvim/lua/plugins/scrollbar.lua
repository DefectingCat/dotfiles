return {
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
}
