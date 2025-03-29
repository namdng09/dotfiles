return {
  -- Soothing pastel theme
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    name = 'catppuccin',
    opts = {
      flavour = "mocha",   -- latte, frappe, macchiato, mocha
      background = {       -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      dim_inactive = {
        enabled = false,    -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15,  -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,    -- Force no italic
      no_bold = false,      -- Force no bold
      no_underline = false, -- Force no underline
      styles = {            -- Handles the styles of general hi groups (see :h highlight-args):
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "bold" },
        functions = { "italic", "bold" },
        keywords = { "bold" },
        strings = { "italic" },
        variables = {},
        numbers = { "bold" },
        booleans = { "bold", "italic" },
        properties = { "italic" },
        types = { "bold" },
        operators = { "bold" },
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      integrations = {
        aerial = true,
        harpoon = true,
        lazygit = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        grug_far = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        navic = { enabled = true, custom_bg = 'lualine' },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },

}
