local M = {}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgr"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.rua = {
  n = {
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gb"] = { "viw" },
    ["<C-a>"] = { "gg<S-v>G" },
    -- $ 跳到行尾不带空格
    ["$"] = { "g_" },
    ["f"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false }
      end,
    },
    ["F"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false }
      end,
    },
    ["<leader>w"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = false }
      end,
    },
    ["<leader>b"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = false }
      end,
    },
  },
  v = {
    ["$"] = { "g_" },
  },
}

return M
