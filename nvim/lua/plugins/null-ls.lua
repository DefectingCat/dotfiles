return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      -- for conciseness
      local formatting = nls.builtins.formatting -- to setup formatters
      local diagnostics = nls.builtins.diagnostics -- to setup linters
      local code_actions = nls.builtins.code_actions
      return {
        -- debug = true,
        sources = {
          -- formator
          formatting.stylua,
          formatting.rustfmt, -- rust formatter
          formatting.black, -- python formatter
          formatting.prettierd.with({
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "vue",
              "css",
              "scss",
              "less",
              "html",
              "json",
              "jsonc",
              "yaml",
              "markdown",
              "markdown.mdx",
              "graphql",
            },
          }), -- js/ts formatter
          formatting.xmlformat.with({
            filetypes = {
              "xml",
              "svg",
            },
          }),
          -- diagnostics
          diagnostics.flake8, -- pythone lsp
          -- diagnostics.eslint_d.with({ -- js/ts linter
          --   -- only enable eslint if root has .eslintrc.js
          --   condition = function(utils)
          --     return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
          --   end,
          -- }),
          diagnostics.hadolint, -- dockerfile linter
          code_actions.eslint_d.with({
            prefer_local = "node_modules/.bin",
          }),
        },
      }
    end,
  },
}
