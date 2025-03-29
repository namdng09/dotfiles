return {
  { "akinsho/bufferline.nvim", opts = { options = { separator_style = "slope" } } },

  {
    "folke/which-key.nvim",
    enabled = true,
    opts = {
      preset = "helix",
      debug = vim.uv.cwd():find("which%-key"),
      win = {},
      spec = {},
    },
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.debug = false
      opts.routes = opts.routes or {}
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          ["not"] = {
            event = "lsp",
            kind = "progress",
          },
          cond = function()
            return not focused and false
          end,
        },
        view = "notify_send",
        opts = { stop = false, replace = true },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
      return opts
    end,
  },

  -- "folke/twilight.nvim",

  -- {
  --   "folke/zen-mode.nvim",
  --   cmd = "ZenMode",
  --   opts = {
  --     window = { backdrop = 0.7 },
  --     plugins = {
  --       gitsigns = true,
  --       tmux = true,
  --       kitty = { enabled = false, font = "+2" },
  --     },
  --   },
  --   keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  -- },
}
