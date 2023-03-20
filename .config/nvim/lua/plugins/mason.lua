return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "rustfmt",
      "rust-analyzer",
      "tailwindcss-language-server",
      "python-lsp-server",
      "css-lsp",
    },
  },
}
