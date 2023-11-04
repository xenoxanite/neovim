local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- normal mode,

-- window navigation.
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- window resize.
keymap("n", "<S-h>", ":vertical resize -2<cr>", opts)
keymap("n", "<S-l>", ":vertical resize +2<cr>", opts)
keymap("n", "<S-j>", ":resize +2<cr>", opts)
keymap("n", "<S-k>", ":resize -2<cr>", opts)

-- basic controll
keymap("n", "<C-s>", ":write<cr>", opts)

