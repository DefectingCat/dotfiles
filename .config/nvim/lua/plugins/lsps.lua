return {
  -- {
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   config = function()
  --     require("lspsaga").setup({})
  --   end,
  --   requires = {
  --     { "nvim-tree/nvim-web-devicons" },
  --     --Please make sure you install markdown and markdown_inline parser
  --     { "nvim-treesitter/nvim-treesitter" },
  --   },
  -- },

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local diagnostic_goto = require("lazyvim.plugins.lsp.keymaps").diagnostic_goto
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<C-j>", diagnostic_goto(true), desc = "Next Diagnostic" }
      keys[#keys + 1] = { "<C-k>", diagnostic_goto(false), desc = "Prev Diagnostic" }
      keys[#keys + 1] =
        { "<C-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
      keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }
      -- disable a keymap
      keys[#keys + 1] = { "]d", false }
      keys[#keys + 1] = { "[d", false }
      keys[#keys + 1] = { "K", false }
      -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua", -- lua lsp
        "shellcheck",
        "shfmt", -- shell formatter
        "flake8", -- python lsp
        "rustfmt",
        "rust-analyzer",
        "css-lsp",
        "vue-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "python-lsp-server",
        "prettier",
        "prettierd",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hadolint", -- dockerfile linter
        "taplo", -- toml formatter
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "jsdoc",
        "toml",
        "rust",
      },
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      -- Use the local version of a parser if available, otherwise download the
      -- remote version.
      local function local_parser(parser, base_url)
        local dir = vim.fn.expand("~/dev/" .. parser)

        if vim.fn.isdirectory(dir) == 1 then
          return dir
        end

        return base_url .. parser
      end
      parser_config.styled = {
        install_info = {
          url = local_parser("tree-sitter-styled", "https://github.com/mskelton/"),
          branch = "main",
          files = { "src/parser.c", "src/scanner.c" },
          generate_requires_npm = true,
        },
        maintainers = { "@mskelton" },
      }
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
