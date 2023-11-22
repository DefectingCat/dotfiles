-- conform.nvim auto save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format { bufnr = args.buf }
--   end,
-- })

-- nvim-lint
-- require('lint').linters_by_ft = {
--   javascript = {"eslint"},
--   typescript = {"eslint"},
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })
--

local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local user_command = vim.api.nvim_create_user_command
vim.g.dap_virtual_text = true
vim.wo.relativenumber = true
-- opt.iskeyword:append("-")
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 20
opt.ignorecase = true
opt.wildignore:append { "*/node_modules/*" }
opt.clipboard:append { "unnamedplus" }

---- 用o换行不要延续注释
local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})
autocmd("BufEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Copy file path
user_command("Cppath", function()
  local path = vim.fn.expand "%:p"
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
user_command("CpRelPath", function()
  local path = vim.fn.expand "%"
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
