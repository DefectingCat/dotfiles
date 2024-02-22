vim.g.rustaceanvim = function()
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

  local cfg = require "rustaceanvim.config"
  return {
    tools = {
      hover_actions = {
        replace_builtin_hover = false,
      },
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
          standalone = true,
          --[[ cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          checkOnSave = {
            allFeatures = true,
            command = "clippy",
          }, ]]
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
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
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
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end
