return {
  -- Find the enemy and replace them with dark power
  {
    'nvim-pack/nvim-spectre',
    config = function()
      vim.keymap.set('n', '<leader>st', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('v', '<leader>sw', '<cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search selected text"
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
      })
    end,
    opts = {
      open_cmd = 'noswapfile vnew',
      mapping = {
        ['toggle_gitignore'] = {
          map = 'tg',
          cmd = "<cmd>lua require('spectre').change_options('gitignore')<CR>",
          desc = 'toggle gitignore',
        },
      },
      find_engine = {
        ['rg'] = {
          cmd = 'rg',
          args = {
            '--pcre2',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--ignore',
          },
          options = {
            ['gitignore'] = {
              value = '--no-ignore',
              icon = '[G]',
              desc = 'gitignore',
            },
          },
        },
      },
      default = {
        find = {
          cmd = 'rg',
          options = { 'ignore-case', 'hidden' },
        },
      },
    },
  },
}
