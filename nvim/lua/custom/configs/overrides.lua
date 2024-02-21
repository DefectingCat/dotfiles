local M = {}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
