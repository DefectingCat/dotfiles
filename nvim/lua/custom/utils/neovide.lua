local opt = vim.opt

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end

if vim.g.neovide then
  local function set_ime(args)
    if args.event:match "Enter$" then
      vim.g.neovide_input_ime = true
    else
      vim.g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime,
  })

  vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime,
  })

  opt.guifont = "JetBrainsMono Nerd Font:h16"
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  --[[ vim.g.neovide_transparency = 0 ]]
  --[[ vim.g.transparency = 0.91 ]]
  --[[ vim.g.neovide_background_color = "#0f1117" .. alpha() ]]
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_input_macos_alt_is_meta = true
end
