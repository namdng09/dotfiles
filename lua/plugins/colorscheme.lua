local spec = {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = true,
  lazy = false,
  priority = 1000,
};

spec.config = function()
  require("catppuccin").setup({
    no_italic = false,    -- Force no italic
    no_bold = false,      -- Force no bold
    no_underline = false, -- Force no underline
    styles = {            -- Handles the styles of general hi groups (see :h highlight-args):
      comments = { "italic" },
      conditionals = { "italic" },
      loops = { "bold" },
      functions = { "italic", "bold" },
      keywords = { "bold" },
      strings = {},
      variables = {},
      numbers = { "bold" },
      booleans = { "bold", "italic" },
      properties = { "italic" },
      types = { "underline" },
      operators = { "bold" },
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    custom_highlights = function(colors)
      return {
        Folded = { bg = colors.none },
        UfoFoldedEllipsis = { fg = colors.blue, bg = colors.none },
      }
    end,
    integrations = {
      mason = true,
      noice = true,
      harpoon = true,
      cmp = true,
      lsp_trouble = true,
      which_key = true,
    }
  })

  vim.cmd.colorscheme("catppuccin")
end

return spec
