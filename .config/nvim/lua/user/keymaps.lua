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

-- test
keymap("n", "<Leader>yu", "", {
    noremap = false,
    callback = function()
        print('test print')
    end,
    silent = true,
    desc = 'test print'
})





-- explorer
-- toggle
keymap("n", "<A-e>", ":NvimTreeToggle<CR>", opts)
-- refresh
keymap("n", "<leader>er", ":NvimTreeRefresh<CR>", opts)





-- window
-- focus
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- split
keymap("n", "<leader>h", ":vsplit<CR>", opts)
keymap("n", "<leader>l", ":vsplit<CR>", opts)
keymap("n", "<leader>k", ":split<CR>", opts)
keymap("n", "<leader>j", ":split<CR>", opts)

-- resize
keymap("n", "<C-A-k>", ":resize -2<CR>", opts)
keymap("n", "<C-A-j>", ":resize +2<CR>", opts)
keymap("n", "<C-A-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-A-l>", ":vertical resize +2<CR>", opts)

-- close
keymap("n", "<leader>w", ":wq<CR>", opts)





-- buffer
-- show
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- close
keymap("n", "<A-w>", ":Bdelete<CR>", opts)






-- editor
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






-- terminal
keymap("t", "jk", "<C-\\><C-n>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

