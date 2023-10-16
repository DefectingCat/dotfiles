local status, scrollbar = pcall(require, "scrollbar")
if not status then
	return
end

-- local colors = require("dracula").colors()
scrollbar.setup({
	handlers = {
		diagnostic = true,
		search = true, -- Requires hlslens to be loaded
	},
})
