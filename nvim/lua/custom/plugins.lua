local plugins = {
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.git.diffview" },
    { import = "nvcommunity.git.lazygit" },
    { import = "nvcommunity.lsp.prettyhover" },
    { import = "nvcommunity.lsp.mason-lspconfig" },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettierd",
        "stylua",
        "rust-analyzer",
        "eslint_d",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "svelte",

        -- low level
        "c",
        "rust",
        "go",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}

return plugins
