return {

  -- Soothing pastel theme
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    name = 'catppuccin',
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = {    -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      dim_inactive = { enabled = false },
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
      color_overrides = {
        latte = {
          -- rosewater = "#dc8a78",
          -- flamingo = "#dd7878",
          -- pink = "#ea76cb",
          -- mauve = "#ed333b",
          -- red = "#d20f39",
          -- maroon = "#e64553",
          -- peach = "#fe640b",
          -- yellow = "#df8e1d",
          -- green = "#40a02b",
          -- teal = "#179299",
          -- sky = "#04a5e5",
          -- sapphire = "#209fb5",
          -- blue = "#1e66f5",
          -- lavender = "#7287fd",
          -- text = "#4c4f69",
          -- subtext1 = "#5c5f77",
          -- subtext0 = "#6c6f85",
          -- overlay2 = "#7c7f93",
          -- overlay1 = "#8c8fa1",
          -- overlay0 = "#9ca0b0",
          -- surface2 = "#acb0be",
          -- surface1 = "#bcc0cc",
          -- surface0 = "#ccd0da",
          base = "#000000",
          mantle = "#e6e9ef",
          crust = "#dce0e8",
        },
      },
    },
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },

  -- Hokusai.
  {
    'rebelot/kanagawa.nvim',
  },

  -- Onedarkpro
  {
    "olimorris/onedarkpro.nvim",
  },
}
