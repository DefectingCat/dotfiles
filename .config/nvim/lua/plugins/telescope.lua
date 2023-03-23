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
