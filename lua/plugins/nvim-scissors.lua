return -- lazy.nvim
{
  "chrisgrieser/nvim-scissors",
  dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
  opts = {
    snippetDir = "./snippets",
  },
  config = function()
    vim.keymap.set(
      "n",
      "<leader>su",
      function() require("scissors").editSnippet() end,
      { desc = "Snippet: Update" }
    )

    -- when used in visual mode, prefills the selection as snippet body
    vim.keymap.set(
      { "n", "x" },
      "<leader>sa",
      function() require("scissors").addNewSnippet() end,
      { desc = "Snippet: Add" }
    )
  end
}
