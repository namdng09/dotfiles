return {
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
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
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

  -- { "folke/which-key.nvim", enabled = true, config = function() end },
  { "folke/noice.nvim", enabled = true },

  "folke/twilight.nvim",
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = { backdrop = 0.7 },
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- filename
	{
		"b0o/incline.nvim",
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

  {
		'rcarriga/nvim-notify',
		priority = 9000,
		keys = {
			{
				'<leader>un',
				function()
					require('notify').dismiss({ silent = true, pending = true })
				end,
				desc = 'Dismiss All Notifications',
			},
		},
		opts = {
			stages = 'static',
			timeout = 5000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
	},

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
    config = function()
      -- call the setup function with properties to define how our lualine will look
      require("lualine").setup({
        options = {
          -- Use web devicons if you have a nerdfont installed
          icons_enabled = true,
          -- Set the theme to dracula, lualine documentation has other themes available as well
          theme = "dracula",
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
          ignore_focus = { "NvimTree" },
          -- Always divide lualine in the middle
          always_divide_middle = true,
          -- Disable global status
          globalstatus = false,
          -- Refresh every 1000 miliseconds
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        -- Setup what each lualine section will contain
        -- sections start at a on the left and go to z on the right
        sections = {
          -- display the current mode in section a
          lualine_a = { "mode" },
          -- display the current git branch, git differences, and any code diagnostics in section b
          lualine_b = { "branch", "diff", "diagnostics" },
          -- display the filename in section c
          lualine_c = { "filename" },
          -- display the file encoding type, os, and filetype in section x
          lualine_x = { "encoding", "fileformat", "filetype" },
          -- display where you are at in the file in section y
          lualine_y = { "progress" },
          -- display exact location of the cursor in section z
          lualine_z = { "location" },
        },
        -- Setup what each section will contain in inactive buffers
        inactive_sections = {
          -- display nothing in sections a and b
          lualine_a = {},
          lualine_b = {},
          -- display the file name in section c
          lualine_c = { "filename" },
          -- display the exact location of the cursor in section x
          lualine_x = { "location" },
          -- display nothing in sections y and z
          lualine_y = {},
          lualine_z = {},
        },
        -- Use default values for tabline, winbar, inactive winbar and extensions
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },

}
