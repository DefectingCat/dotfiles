local options = {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },
    },
  },
}

local telescope = require "telescope"
telescope.load_extension "ui-select"
telescope.load_extension "notify"
telescope.load_extension "fzf"

return options
