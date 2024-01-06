local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local mason_registry = require "mason-registry"
local codelldb = mason_registry.get_package "codelldb"
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = ""
if vim.loop.os_uname().sysname:find "Windows" then
  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
elseif vim.fn.has "mac" == 1 then
  liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
else
  liblldb_path = extension_path .. "lldb/lib/liblldb.so"
end

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        standalone = true,
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
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
          },
        },
      },
      check = {
        command = "clippy",
        features = "all",
        extraArgs = { "--no-deps" },
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
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
  tools = {
    on_initialized = function()
      vim.cmd [[
              augroup RustLSP
                autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
              augroup END
            ]]
    end,
  },
}

return options
