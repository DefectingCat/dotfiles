local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})
