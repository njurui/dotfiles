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

-- Enable j,k to move correctly in wrapped text (no number prefix)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- magic search (default is :set magic)
-- vim.keymap.set("n", "/", "/\\m", { noremap = true, silent = false })
-- vim.keymap.set("v", "/", "/\\m", { noremap = true, silent = false })

-- indent
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- erase J mapping
vim.keymap.set("n", "J", "", { noremap = true, silent = true })

-- erase u, U mapping in visual
vim.keymap.set("v", "u", "", { noremap = true, silent = true })
vim.keymap.set("v", "U", "", { noremap = true, silent = true })

-- move up and down (cannot use <cmd>...<cr> here)
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- paste in visual mode won't change the clipboard (disabled due to conflict with cmp)
-- vim.keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

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
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n><C-w>c', { noremap = true, silent = true })
vim.keymap.set('t', '<C-h>', '<cmd>wincmd h<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<cr>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', '<cmd>wincmd l<cr>', { noremap = true, silent = true })

-- open file in terminal
-- vim.keymap.set('n', '<C-LeftMouse>', '<LeftMouse>gF', { noremap = true, silent = true })
-- vim.keymap.set('t', '<C-LeftMouse>', '<LeftMouse>gF', { noremap = true, silent = true })
