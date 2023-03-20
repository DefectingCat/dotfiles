local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
-- local action_state = require("telescope.actions.state")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
	defaults = {
		initial_mode = "normal",
		mappings = {
			n = {
				["q"] = actions.close,
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
				},
			},
		},
	},
})

vim.keymap.set("n", "<C-p>", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", ";r", function()
	builtin.live_grep()
end)

vim.keymap.set("n", ";;", function()
	builtin.buffers()
end)
vim.keymap.set("n", ";t", function()
	builtin.help_tags()
end)
vim.keymap.set("n", ";d", function()
	builtin.oldfiles()
end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
vim.keymap.set("n", ";e", function()
	builtin.diagnostics()
end)
