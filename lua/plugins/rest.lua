return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
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
