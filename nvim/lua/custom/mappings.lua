local M = {}

M.disabled = {
  n = {
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
    ["<leader>cm"] = "",
  },
}

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

M.lspsaga = {
  n = {
    ["<C-.>"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "󰅱 Code Action",
    },
    ["gf"] = {
      function()
        vim.cmd "Lspsaga lsp_finder"
      end,
      " Go to definition",
    },
    ["gt"] = {
      "<CMD>Lspsaga goto_definition<CR>",
      " Go to definition",
    },
    ["<leader>lp"] = {
      "<CMD>Lspsaga peek_definition<CR>",
      " Peek definition",
    },
    ["gh"] = {
      function()
        vim.lsp.buf.hover()
        --[[ require("pretty_hover").hover() ]]
      end,
      "󱙼 Hover lsp",
    },
    ["gr"] = { "<CMD>Telescope lsp_references<CR>", " Lsp references" },
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

    -- arrange buffer
    ["<leader>pl"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move buffer right",
    },
    ["<leader>ph"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move buffer left",
    },

    -- notify
    ["<leader>un"] = {
      function()
        require("notify").dismiss { silent = true, pending = true }
      end,
      "Dismiss all Notifications",
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
  -- term
  t = {
    --[[ ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" }, ]]
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<CR>" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<CR>" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<CR>" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<CR>" },
    ["gR"] = { "<cmd>TroubleToggle lsp_references<CR>" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gd"] = { "<cmd> DiffviewOpen <CR>", "Open diff view" },
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Open LazyGit" },
    ["<leader>gf"] = { "<cmd> LazyGitFilterCurrentFile <CR>", "Open LazyGit fitler current file" },
    ["<leader>gh"] = { "<cmd> DiffviewFileHistory % <CR>", "Open current file history" },
    ["<leader>gc"] = { "<cmd> DiffviewClose <CR>", "Close Diffview" },
    ["<leader>fd"] = {
      function()
        require("telescope.builtin").diagnostics()
      end,
      "Find Diagnostics",
    },
    ["<leader>fn"] = {
      function()
        require("telescope").extensions.notify.notify()
      end,
      "View notify history",
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

M.lspconfig = {
  plugin = true,

  --[[ n = {
    ["<leader>ca"] = {
      function()
        vim.ui.select(vim.lsp.buf.code_action)
      end,
      "LSP code action",
    },
  }, ]]
  n = {
    ["<leader>co"] = {
      "<cmd> OrganizeImports <CR>",
      "Organize imports",
    },
  },
}

return M
