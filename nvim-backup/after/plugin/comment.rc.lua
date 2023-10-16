local status, comment = pcall(require, "nvim_comment")
if not status then
	return
end

comment.setup({
	-- comment_empty = false
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
			require("ts_context_commentstring.internal").update_commentstring()
		end
		if vim.api.nvim_buf_get_option(0, "filetype") == "typescriptreact" then
			require("ts_context_commentstring.internal").update_commentstring()
		end
		if vim.api.nvim_buf_get_option(0, "filetype") == "javascriptreact" then
			require("ts_context_commentstring.internal").update_commentstring()
		end
	end,
})
