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
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<leader>drr"] = {
      "<cmd> RustLsp debuggables <CR>",
      "Run rust debug on current file",
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

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
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
    --[[ ["gf"] = {
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
    }, ]]
    ["gh"] = {
      function()
        --[[ vim.lsp.buf.hover() ]]
        require("pretty_hover").hover()
      end,
      "󱙼 Hover lsp",
    },
    ["gr"] = { "<CMD>Telescope lsp_references<CR>", " Lsp references" },
    ["gd"] = { "<CMD>Telescope lsp_definitions <CR>", " Lsp definitions" },
  },
}

M.rua = {
  n = {
    ["<tab>"] = {
      "<CMD> tabNext <CR>",
      "Goto next tab",
    },
    ["<S-tab>"] = {
      "<CMD> tabprevious <CR>",
      "Goto prev tab",
    },

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
    ["<leader>pa"] = {
      "<CMD> %bd|e#|bd# <CR>",
      "Close all other buffers",
    },
    ["<C-a>"] = { "gg<S-v>G" },
    -- $ 跳到行尾不带空格
    ["$"] = { "g_" },
    -- motion
    ["f"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end,
      "Hop motion search in current line after cursor",
    },
    ["F"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end,
      "Hop motion search in current line before cursor",
    },
    ["<leader>w"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end,
      "Hop motion search words after cursor",
    },
    ["<leader>b"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end,
      "Hop motion search words before cursor",
    },

    -- term
    ["<A-o>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },
    ["<D-o>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },
    ["<D-i>"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "Toggle floating term",
    },
    ["<A-u>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "Toggle vertical term",
    },
    ["<D-u>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "Toggle vertical term",
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
        require("notify").dismiss({ silent = true, pending = true })
      end,
      "Dismiss all Notifications",
    },

    -- markdown preview
    ["<leader>pm"] = {
      "<cmd> MarkdownPreview <CR>",
      "Preview Markdown file",
    },

    -- window split
    ["<leader>|"] = {
      "<cmd> vs <CR>",
      "Split window vertically",
    },
    ["<leader>_"] = {
      "<cmd> sp <CR>",
      "Split window horizontally",
    },

    -- spectre search
    ["<leader>ss"] = {
      '<cmd>lua require("spectre").toggle()<CR>',
      "Toggle Spectre",
    },
    ["<leader>sw"] = {
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      "Spectre search current word",
    },
    ["<leader>sp"] = {
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      "Spectre search on current file",
    },
  },
  v = {
    ["$"] = { "g_" },
    -- motion
    ["f"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end,
      "Hop motion search in current line after cursor",
    },
    ["F"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end,
      "Hop motion search in current line before cursor",
    },
    ["<leader>w"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
      end,
      "Hop motion search words after cursor",
    },
    ["<leader>b"] = {
      function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
      end,
      "Hop motion search words before cursor",
    },

    -- spectre search
    ["<leader>sw"] = {
      '<esc><cmd>lua require("spectre").open_visual()<CR>',
      "Spectre search current word",
    },
  },
  -- term
  t = {
    ["<A-o>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },
    ["<D-o>"] = {
      function()
        require("nvterm.terminal").toggle("horizontal")
      end,
      "Toggle horizontal term",
    },
    ["<D-i>"] = {
      function()
        require("nvterm.terminal").toggle("float")
      end,
      "Toggle floating term",
    },
    ["<A-u>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "Toggle vertical term",
    },
    ["<D-u>"] = {
      function()
        require("nvterm.terminal").toggle("vertical")
      end,
      "Toggle vertical term",
    },
    --[[ ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" }, ]]
  },
}

M.trouble = {
  n = {
    ["<leader>tx"] = { "<cmd>TroubleToggle<CR>" },
    ["<leader>tw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>" },
    ["<leader>td"] = { "<cmd>TroubleToggle document_diagnostics<CR>" },
    ["<leader>tq"] = { "<cmd>TroubleToggle quickfix<CR>" },
    ["<leader>tl"] = { "<cmd>TroubleToggle loclist<CR>" },
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
    ["<leader>fc"] = {
      function()
        require("telescope.builtin").command_history()
      end,
      "Search command history",
    },
    ["<leader>fr"] = {
      function()
        require("telescope.builtin").resume()
      end,
      "Resume last search",
    },
    ["<leader>ft"] = {
      function()
        require("telescope.builtin").filetypes()
      end,
      "Set current filetype",
    },
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
        vim.cmd("WhichKey")
      end,
      "Which-key all keymaps",
    },
    ["<leader>k"] = {
      function()
        local input = vim.fn.input("WhichKey: ")
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
