local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local lga_actions = require("telescope-live-grep-args.actions")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- override default mappings
      -- default_mappings = {},
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
        }
      }
    }
  --   file_browser = {
  --     theme = "dropdown",
  --     -- disables netrw and use telescope-file-browser in its place
  --     hijack_netrw = true,
  --     mappings = {
  --       -- your custom insert mode mappings
  --       ["i"] = {
  --         ["<C-w>"] = function() vim.cmd('normal vbd') end,
  --       },
  --       ["n"] = {
  --         -- your custom normal mode mappings
  --         ["N"] = fb_actions.create,
  --         ["h"] = fb_actions.goto_parent_dir,
  --         ["/"] = function()
  --           vim.cmd('startinsert')
  --         end
  --       },
  --     },
  --   },
 },
}

-- telescope.load_extension("file_browser")

vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", ";s", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- vim.keymap.set("n", "sf", function()
--   telescope.extensions.file_browser.file_browser({
--     path = "%:p:h",
--     cwd = telescope_buffer_dir(),
--     respect_gitignore = false,
--     hidden = true,
--     grouped = true,
--     previewer = false,
--     initial_mode = "normal",
--     layout_config = { height = 40 }
--   })
-- end)
