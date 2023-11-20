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
    -- motion
    ["f"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false }
      end,
      "Hop motion search in current line after cursor",
    },
    ["F"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false }
      end,
      "Hop motion search in current line before cursor",
    },
    ["<leader>w"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = false }
      end,
      "Hop motion search words after cursor",
    },
    ["<leader>b"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = false }
      end,
      "Hop motion search words before cursor",
    },

    -- term
    ["<A-o>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },
  v = {
    ["$"] = { "g_" },
    -- motion
    ["f"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = false }
      end,
      "Hop motion search in current line after cursor",
    },
    ["F"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = false }
      end,
      "Hop motion search in current line before cursor",
    },
    ["<leader>w"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_words { direction = directions.AFTER_CURSOR, current_line_only = false }
      end,
      "Hop motion search words after cursor",
    },
    ["<leader>b"] = {
      function()
        local hop = require "hop"
        local directions = require("hop.hint").HintDirection
        hop.hint_words { direction = directions.BEFORE_CURSOR, current_line_only = false }
      end,
      "Hop motion search words before cursor",
    },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>K"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>k"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

M.workspace = {
  plugin = true,

  ["<leader>ma"] = {
    function()
      vim.lsp.buf.add_workspace_folder()
    end,
    "Add workspace folder",
  },

  ["<leader>mr"] = {
    function()
      vim.lsp.buf.remove_workspace_folder()
    end,
    "Remove workspace folder",
  },

  ["<leader>ml"] = {
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    "List workspace folders",
  },
}

M.disabled = {
  n = {
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
  },
}

return M
