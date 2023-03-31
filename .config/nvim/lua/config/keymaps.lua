-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
-- local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
-- $跳到行尾不带空格 (交换$ 和 g_)
keymap.set("v", "$", "g_")
-- keymap.set("v", "g_", "$")
keymap.set("n", "$", "g_")
-- keymap.set("n", "g_", "$")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "clear highlights" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Move window
-- keymap.set("", "<leader>h", "<C-w>h")
-- keymap.set("", "<leader>k", "<C-w>k")
-- keymap.set("", "<leader>j", "<C-w>j")
-- keymap.set("", "<leader>l", "<C-w>l")

-- Select current world
keymap.set("n", "gb", "viw")

-- Terminal
keymap.set("", "<Esc>", "<C-><C-n>", { noremap = true })

-- Comment
-- keymap.set("n", "<C-/>", "gcip")
