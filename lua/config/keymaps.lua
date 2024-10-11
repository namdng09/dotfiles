-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jj to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("i", "kk", "<ESC>:w<CR>", { desc = "Exit insert mode and save with kk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move forward 1/2 a screen and in the middle" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move back 1/2 a screen and in the middle" })
keymap.set("n", "n", "nzzzv", { desc = "jump to the next instance of a word and in the middle" })
keymap.set("n", "N", "Nzzzv", { desc = "jump to the previous instance of a word and in the middle" })
keymap.set("n", "*", "*zzzv", { desc = "jump to the next instance of a word and in the middle" })
keymap.set("n", "#", "#zzzv", { desc = "jump to the previous instance of a word and in the middle" })

keymap.set("n", "<leader>o", "o<Esc>", { desc = "Create a new line below and still in normal mode" })
keymap.set("n", "<leader>O", "O<Esc>", { desc = "Create a new line above and still in normal mode" })

keymap.set("n", "<leader>yy", "<cmd>%y<CR>", { desc = "Yank all lines in file" })
keymap.set("n", "<leader>dd", "<cmd>%d<CR>", { desc = "Delete all lines in file" })

keymap.set("n", "<leader>rn", ":IncRename ")
