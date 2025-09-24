-- Scrolloff
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Line number
vim.opt.number = true
vim.opt.relativenumber = false

-- Cursor line highlight
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"

-- Sign column between fold column and line number
vim.opt.signcolumn = "yes"

-- Right-side reference line
vim.opt.colorcolumn = "160"

-- Mouse support
vim.opt.mouse = "a"

-- Tab and indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Auto reload
vim.opt.autoread = true

-- Wrap
vim.opt.wrap = false

-- Allow <Left> and <Right> to jump to the previous/next line when at the beginning / end of a line
vim.opt.whichwrap = "<,>,[,]"

-- Horizental separate line
vim.opt.laststatus = 3

-- Disable backup file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Control time to write to disk and cursorhold event
vim.opt.updatetime = 200

-- Key mapping timeout
vim.opt.timeoutlen = 300

-- Split window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Invisible char display style
-- vim.opt.list = true
-- vim.opt.listchars = "space:·"

-- Commandline completion mode
vim.opt.wildmode = "longest:full,full"

-- Disable additional notification
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Maximum number of item in popup menu
vim.opt.pumheight = 10

-- Disable default mode hint (-- INSERT/VISUAL --)
vim.opt.showmode = false

-- Allows neovim to access the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable persistent undo
vim.opt.undofile = true

-- Hide additional tilde at the end of buffer
vim.opt.fillchars = { eob = " " }

-- Set all default border to rounded
vim.opt.winborder = "rounded"
