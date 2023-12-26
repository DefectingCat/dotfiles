local opts = {
  ensure_installed = {
    -- defaults
    "vim",
    "vimdoc",
    "lua",
    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "vue",
    "markdown",
    "markdown_inline",
    "jsdoc",
    "scss",
    -- low level
    "rust",
    "toml",
    "go",
  },
  autotag = {
    enable = true,
  },
  highlight = {
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
}

return opts
