return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(filepath)
              local image_extensions = { "png", "jpg", "jpeg", "gif" } -- Supported image formats
              local split_path = vim.split(filepath:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "viu",
                "-w",
                "45",
                "-b",
                filepath,
              }, {
                on_stdout = send_output,
                stdout_buffered = true,
              })
            else
              require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
          end,
        },
      },
      -- highlights = {
      --   -- set highlights for all themes
      --   -- use a function override to let us use lua to retrieve colors from highlight group
      --   -- there is no default table so we don't need to put a parameter for this function
      --   init = function()
      --     local get_hlgroup = require("utils").get_hlgroup
      --     -- get highlights from highlight groups
      --     local normal = get_hlgroup("Normal")
      --     local fg, bg = normal.fg, normal.bg
      --     local bg_alt = get_hlgroup("Visual").bg
      --     local green = get_hlgroup("String").fg
      --     local red = get_hlgroup("Error").fg
      --     -- return a table of highlights for telescope based on colors gotten from highlight groups
      --     return {
      --       TelescopeBorder = { fg = bg_alt, bg = bg },
      --       TelescopeNormal = { bg = bg },
      --       TelescopePreviewBorder = { fg = bg, bg = bg },
      --       TelescopePreviewNormal = { bg = bg },
      --       TelescopePreviewTitle = { fg = bg, bg = green },
      --       TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
      --       TelescopePromptNormal = { fg = fg, bg = bg_alt },
      --       TelescopePromptPrefix = { fg = red, bg = bg_alt },
      --       TelescopePromptTitle = { fg = bg, bg = red },
      --       TelescopeResultsBorder = { fg = bg, bg = bg },
      --       TelescopeResultsNormal = { bg = bg },
      --       TelescopeResultsTitle = { fg = bg, bg = bg },
      --     }
      --   end,
      -- },
    },

    keys = {
      -- disable the keymap to grep files
      { "<leader><space>", false },
      -- change a keymap
      -- { "<leader>ff", "Telescope find_files", desc = "Find Files" },
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },

    extensions_list = { "themes", "terms" },
  },

  -- {
  --   "nvim-telescope/telescope-media-files.nvim",
  --   config = function()
  --     -- Load extensions
  --     require("telescope").load_extension("media_files")
  --     require("telescope").setup({
  --       extensions = {
  --         media_files = {
  --           -- filetypes whitelist
  --           -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
  --           filetypes = { "png", "webp", "jpg", "jpeg" },
  --           -- find command (defaults to `fd`)
  --           find_cmd = "rg",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
