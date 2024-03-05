vim.g.rustaceanvim = function()
  local mason_registry = require("mason-registry")
  local codelldb = mason_registry.get_package("codelldb")
  local extension_path = codelldb:get_install_path() .. "/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = ""

  if vim.loop.os_uname().sysname:find("Windows") then
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
  elseif vim.fn.has("mac") == 1 then
    liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
  else
    liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  end

  -- keymap
  local bufnr = vim.api.nvim_get_current_buf()
  vim.keymap.set("n", "<leader>ca", function()
    --[[ vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping ]]
    vim.lsp.buf.code_action()
  end, { silent = true, buffer = bufnr })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, buffer = bufnr })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, buffer = bufnr })

  local cfg = require("rustaceanvim.config")
  return {
    tools = {},
    server = {
      settings = {
        ["rust-analyzer"] = {
          standalone = true,
          files = {
            excludeDirs = {
              ".flatpak-builder",
              "_build",
              ".dart_tool",
              ".flatpak-builder",
              ".git",
              ".gitlab",
              ".gitlab-ci",
              ".gradle",
              ".idea",
              ".next",
              ".project",
              ".scannerwork",
              ".settings",
              ".venv",
              "archetype-resources",
              "bin",
              "hooks",
              "node_modules",
              "po",
              "screenshots",
              "target",
              "out",
              "../out",
              "../node_modules",
              "../.next",
            },
          },
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end
