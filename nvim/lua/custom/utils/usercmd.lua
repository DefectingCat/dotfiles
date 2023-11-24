local user_command = vim.api.nvim_create_user_command

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
