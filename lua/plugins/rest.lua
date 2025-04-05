return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  config = function()
    local rest_nvim = require("rest-nvim")

    rest_nvim.setup({
      response = {
        hooks = {
          decode_url = true,
          format = true, -- dùng gq, sẽ hoạt động nếu formatprg thiết lập đúng
        },
      },
      clients = {
        curl = {
          statistics = {
            { id = "time_total",    winbar = "take", title = "Time taken" },
            { id = "size_download", winbar = "size", title = "Download size" },
          },
          opts = {
            set_compressed = false,
            certificates = {},
          },
        },
      },
      cookies = {
        enable = true,
        path = vim.fs.joinpath(vim.fn.stdpath("data"), "rest-nvim.cookies"),
      },
      env = {
        enable = true,
        pattern = ".*%.env.*",
        find = function()
          local config = require("rest-nvim.config")
          return vim.fs.find(function(name, _)
            return name:match(config.env.pattern)
          end, {
            path = vim.fn.getcwd(),
            type = "file",
            limit = math.huge,
          })
        end,
      },
      ui = {
        winbar = true,
        keybinds = {
          prev = "H",
          next = "L",
        },
      },
      highlight = {
        enable = true,
        timeout = 750,
      },
      _log_level = vim.log.levels.WARN,
    })
  end,

  keys = {
    { "<leader>rr", "<cmd>Rest run<cr>",        desc = "Rest: Run request" },
    { "<leader>rl", "<cmd>Rest last<cr>",       desc = "Rest: Run last request" },
    { "<leader>ro", "<cmd>Rest open<cr>",       desc = "Rest: Open result pane" },
    { "<leader>rg", "<cmd>Rest logs<cr>",       desc = "Rest: Edit logs" },
    { "<leader>rc", "<cmd>Rest cookies<cr>",    desc = "Rest: Edit cookies" },
    { "<leader>re", "<cmd>Rest env show<cr>",   desc = "Rest: Show env" },
    { "<leader>rs", "<cmd>Rest env select<cr>", desc = "Rest: Select env" },
    { "<leader>rS", "<cmd>Rest env set<cr>",    desc = "Rest: Set env (manual input)" },
  }
}
