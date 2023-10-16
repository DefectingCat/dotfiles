vim.cmd("autocmd!")

local opt = vim.opt

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.nu = true
vim.wo.rnu = true

opt.title = true
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.laststatus = 2
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false -- No Wrap lines
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })
opt.clipboard:append({ "unnamedplus" })
opt.cursorline = true
opt.termguicolors = true
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Use color theme
vim.cmd([[colorscheme dracula]])
