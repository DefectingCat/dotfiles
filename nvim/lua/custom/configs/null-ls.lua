local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
local code_actions = null_ls.builtins.code_actions

local opts = {
  sources = {
    -- Golang
    formatting.gofmt,
    formatting.goimports_reviser,
    formatting.golines,
    -- JavaScript
    formatting.prettierd,
    diagnostics.eslint_d.with {
      only_local = "node_modules/.bin",
    },
    -- Lua
    formatting.stylua,
    -- XML and SVG
    formatting.xmlformat.with {
      filetypes = {
        "xml",
        "svg",
      },
    },
    diagnostics.hadolint, -- dockerfile linter
    code_actions.eslint_d.with {
      only_local = "node_modules/.bin",
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
