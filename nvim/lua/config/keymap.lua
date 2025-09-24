-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- $ jump to line end without space
vim.keymap.set("v", "$", "g_", { noremap = true, silent = true })
vim.keymap.set("v", "g_", "$", { noremap = true, silent = true })
vim.keymap.set("n", "$", "g_", { noremap = true, silent = true })
vim.keymap.set("n", "g_", "$", { noremap = true, silent = true })

-- quick save and quit
vim.keymap.set("n", "<leader>w", "<cmd>wa<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>qa<cr>", { noremap = true, silent = true })

-- Enable j,k to move correctly in wrapped text
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- magic search
vim.keymap.set("n", "/", "/\\m", { noremap = true, silent = false })
vim.keymap.set("v", "/", "/\\m", { noremap = true, silent = false })

-- indent
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
-- move up and down
vim.keymap.set("v", "J", "<cmd>move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", "<cmd>move '<-2<cr>gv-gv", { noremap = true, silent = true })

-- paste in visual mode won't change the clipboard
vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

-- erase q mapping
vim.keymap.set("n", "q", "", { noremap = true, silent = true })
vim.keymap.set("v", "q", "", { noremap = true, silent = true })

-- split
vim.keymap.set("n", "s", "", { noremap = true, silent = true })
vim.keymap.set("n", "sv", "<cmd>vsp<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "sh", "<cmd>sp<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "sc", "<C-w>c", { noremap = true, silent = true })
vim.keymap.set("n", "so", "<C-w>o", { noremap = true, silent = true })

-- move pane focus
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- terminal
vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-/>', '<C-\\><C-n><C-w>c', { noremap = true, silent = true })
vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<cr>', { noremap = true, silent = true })
