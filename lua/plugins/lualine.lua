return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    -- call the setup function with properties to define how our lualine will look
    local custom_horizon = require 'lualine.themes.horizon'
    -- custom_horizon.normal.c.bg = 'None'
    require("lualine").setup({
      options = {

        -- Use web devicons if you have a nerdfont installed
        icons_enabled = true,
        -- Set the theme to dracula, lualine documentation has other themes available as well
        theme = custom_horizon,
        -- Separate components of lua line with chevrons
        component_separators = { left = "", right = "" },
        -- Separate sections with solid triangles
        section_separators = { left = "", right = "" },
        -- disable the status line and winbar
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        -- Don't focus lualine on NvimTree
        -- ignore_focus = { "NvimTree" },
        -- Always divide lualine in the middle
        always_divide_middle = false,
        always_show_tabline = false,
        globalstatus = true,
        refresh = {
          statusline = 10,
          tabline = 10,
          winbar = 10,
        }
      },
      -- Setup what each lualine section will contain
      -- sections start at a on the left and go to z on the right
      sections = {
        -- display the current mode in section a
        lualine_a = {
          {
            'mode',
            icons_enabled = true, -- Enables the display of icons alongside the component.
            color = { gui = 'italic,bold' },
          }
        },
        -- display the current git branch, git differences, and any code diagnostics in section b
        lualine_b = { "branch", "diff", "diagnostics" },
        -- display the filename in section c
        lualine_c = {},
        -- display the file encoding type, os, and filetype in section x
        lualine_x = {},
        -- display where you are at in the file in section y
        lualine_y = { "filetype" },
        -- display exact location of the cursor in section z
        lualine_z = { "location" },
      },
      -- Setup what each section will contain in inactive buffers
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      -- Use default values for tabline, winbar, inactive winbar and extensions
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      winbar = {
        lualine_a = {
          {
            'filename',
            file_status = true,     -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 4,               -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 20, -- Shortens path to leave 20 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = ' ', -- Text to show when the file is modified.
              readonly = '', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '󰏝', -- Text to show for unnamed buffers.
              newfile = '', -- Text to show for newly created file before first write
            },
            -- color = { fg = '#ffaa88', bg = 'inactivegray', gui = 'italic,bold' },
            padding = 1, -- Adds padding to the left and right of components.
            -- Padding can be specified to left or right independently, e.g.:
            --   padding = { left = left_padding, right = right_padding }
          }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {
          {
            'filename',
            file_status = true,     -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 4,               -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 20, -- Shortens path to leave 20 spaces in the window
            symbols = {
              modified = ' ', -- Text to show when the file is modified.
              readonly = '', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '󰏝', -- Text to show for unnamed buffers.
              newfile = '', -- Text to show for newly created file before first write
            },
            color = { fg = '#ffaa88', gui = 'italic,bold' },
          }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    })
  end,
}
