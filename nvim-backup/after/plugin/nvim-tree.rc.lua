local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

local list_keys = require("xfy.maps").nvimTreeList

tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		side = "left",
		mappings = {
			-- 只用内置快捷键
			custom_only = true,
			list = list_keys,
		},
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭 tree
			quit_on_open = false,
		},
	},
})
