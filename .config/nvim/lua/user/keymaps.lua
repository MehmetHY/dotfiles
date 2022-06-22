local opts = { noremap = true, silent = true }

local term_opts = { noremap = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- modes
-- n    normal
-- i    insert
-- v    visual
-- x    visual block
-- t    terminal
-- c    command

-- keys
-- C        ctrl
-- S        shift
-- A        alt
-- M        super
-- CR       enter
-- leader   space

-- keymap(mode, key, command, options)

-- nvim-tree
keymap("n", "<A-e>", ":NvimTreeToggle<CR>", opts)

-- window
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<A-w>", ":bdelete<CR>", opts)

-- line movement
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
keymap("x", "<A-j>", ":move '>+1<CR>", opts)
keymap("x", "<A-k>", ":move '<-2<CR>", opts)
keymap("v", "<A-j>", ":m .+1<CR>", opts)
keymap("v", "<A-k>", ":m .-2<CR>", opts)

-- exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- keep buffer after paste
keymap("v", "p", '"_dP', opts)
