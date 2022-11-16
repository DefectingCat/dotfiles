vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "x", '"_x')
-- $跳到行尾不带空格 (交换$ 和 g_)
keymap.set("v", "$", "g_")
keymap.set("v", "g_", "$")
keymap.set("n", "$", "g_")
keymap.set("n", "g_", "$")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- Save single file
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>wq", ":wqa!<CR>")

-- Terminal相关
keymap.set("n", "st", ":sp | terminal<CR>")
keymap.set("n", "stv", ":vsp | terminal<CR>")
-- Esc 回 Normal 模式
keymap.set("t", "<Esc>", "<C-\\><C-n>")
keymap.set("t", "<A-h>", [[ <C-\><C-N><C-w>h ]])
keymap.set("t", "<A-j>", [[ <C-\><C-N><C-w>j ]])
keymap.set("t", "<A-k>", [[ <C-\><C-N><C-w>k ]])
keymap.set("t", "<A-l>", [[ <C-\><C-N><C-w>l ]])
keymap.set("t", "<leader>h", [[ <C-\><C-N><C-w>h ]])
keymap.set("t", "<leader>j", [[ <C-\><C-N><C-w>j ]])
keymap.set("t", "<leader>k", [[ <C-\><C-N><C-w>k ]])
keymap.set("t", "<leader>l", [[ <C-\><C-N><C-w>l ]])

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit<Return>")
-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")
keymap.set("n", "sw", ":bd<Return>")
keymap.set("n", "sx", ":close<CR>") -- close current split window
-- Move window
-- keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "<leader>h", "<C-w>h")
keymap.set("", "<leader>k", "<C-w>k")
keymap.set("", "<leader>j", "<C-w>j")
keymap.set("", "<leader>l", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Virtual mode setting
keymap.set("v", "p", '"_dP')
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- plugin keymaps

-- vim-miximzer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- File manager
keymap.set("n", "<leader>e", ":NvimTreeToggle<Return>")

-- Comment
-- keymap.set('n', '<C-/>', ':gcc<CR>')

-- Motion
keymap.set(
	"",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
keymap.set(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
keymap.set("", "<leader><leader>", ":HopWord<Return>")

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- Select current world
keymap.set("n", "gb", "viw")

-- Comment
keymap.set("", "<C-/>", ":Comment<Return>")

local pluginKeys = {}

-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
	{ key = { "o", "<2-LeftMouse>" }, action = "system_open" },
	{ key = "<CR>", action = "edit" },
	-- v分屏打开文件
	{ key = "v", action = "vsplit" },
	-- h分屏打开文件
	{ key = "h", action = "split" },
	-- Ignore (node_modules)
	{ key = "i", action = "toggle_ignored" },
	-- Hide (dotfiles)
	{ key = ".", action = "toggle_dotfiles" },
	{ key = "R", action = "refresh" },
	-- 文件操作
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },
	{ key = "I", action = "toggle_file_info" },
	{ key = "n", action = "tabnew" },
	-- 进入下一级
	{ key = { "]" }, action = "cd" },
	-- 进入上一级
	{ key = { "[" }, action = "dir_up" },
}

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
	vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
	vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
	vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
	vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
	local gs = package.loaded.gitsigns

	local function map(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	map("n", "<leader>gj", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	map("n", "<leader>gk", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, { expr = true })

	-- map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
	-- map("n", "<leader>gS", gs.stage_buffer)
	-- map("n", "<leader>gu", gs.undo_stage_hunk)
	-- map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
	map("n", "<leader>gR", gs.reset_buffer)
	map("n", "<leader>gp", gs.preview_hunk)
	map("n", "<leader>gb", function()
		gs.blame_line({ full = true })
	end)
	map("n", "<leader>gd", gs.diffthis)
	map("n", "<leader>gD", function()
		gs.diffthis("~")
	end)
	-- toggle
	map("n", "<leader>gtd", gs.toggle_deleted)
	map("n", "<leader>gtb", gs.toggle_current_line_blame)
	-- Text object
	map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

return pluginKeys
