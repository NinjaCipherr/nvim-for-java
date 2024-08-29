
-- Set our leader keybinding to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Exit Vim's terminal mode with jk
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode with jk" })

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Open terminal window with Ctrl + t
vim.keymap.set("n", "<C-t>", "<cmd>split | terminal<CR>", { desc = "Open terminal window" })

-- Close terminal window with Ctrl + t
vim.keymap.set("n", "<C-t>", "<cmd>bd!<CR>", { desc = "Close terminal window" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Exit insert mode with a message
vim.keymap.set("i", "jk", "<Esc>:echo 'Exiting Insert Mode'<CR>", { desc = "Exit insert mode with message" })

-- Save and quit shortcuts
vim.keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Save with :w!" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Quit with :q!" })

-- Easily split windows
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>h", ":split<CR>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })
