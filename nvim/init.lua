-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Customize window separator colors
vim.cmd([[
  highlight WinSeparator guifg=#ffffff guibg=none
]])
