local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"toml",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"go",
		"rust",
		"javascript",
		"typescript",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"vim",
		"dockerfile",
		"gitignore",
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	-- p00f/nvim-ts-rainbow
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#95ca60",
			"#ee6985",
			"#D6A760",
			"#7794f4",
			"#b38bf5",
			"#7cc7fe",
		}, -- table of hex strings
		-- termcolors = { } -- table of colour name strings
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
