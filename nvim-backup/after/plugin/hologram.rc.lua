local status, hologram = pcall(require, "edluffy/hologram.nvim")
if not status then
	return
end

hologram.setup({
	auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
})
