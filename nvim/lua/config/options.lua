-- Scrolloff
vim.opt.scrolloff = 4
-- vim.opt.sidescrolloff = 0

-- Enable smoothscroll
vim.opt.smoothscroll = true

-- Line number
vim.opt.number = true
vim.opt.relativenumber = false

-- Cursor line highlight
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"

-- Sign column between fold column and line number
vim.opt.signcolumn = "yes"

-- Folding
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars:append({
    fold = " ",
    foldopen = "",
    foldsep = " ",
    foldclose = "",
    foldinner = " ",
})

-- Right-side reference line
vim.opt.colorcolumn = "160"

-- Mouse support
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
-- vim.opt.mousescroll = "ver:1,hor:0"

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
vim.opt.linebreak = true

-- Allow <Left> and <Right> to jump to the previous/next line when at the beginning / end of a line
vim.opt.whichwrap = "<,>,[,]"

-- Horizental separate line
vim.opt.laststatus = 3

-- Disable the default ruler
vim.opt.ruler = false

-- Disable backup file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Control time to write to disk and cursorhold event
vim.opt.updatetime = 200

-- Key mapping timeout
vim.opt.timeoutlen = 300

-- Split window
vim.opt.splitkeep = "screen"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Jump option <C-o> and <C-i>
vim.opt.jumpoptions = "view"

-- Invisible char display style
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
    extends = "…",
}

-- Enable auto save
vim.opt.autowriteall = true

-- Commandline completion mode
vim.opt.wildmode = "noselect,full"
vim.opt.wildoptions = "pum,fuzzy"

-- Builtin completion options
vim.opt.completeopt = "menuone,noinsert,fuzzy"
vim.opt.completeitemalign = "kind,abbr,menu"

-- Disable additional notification
vim.opt.shortmess:append("WIcC")

-- Maximum number of item in popup menu
vim.opt.pumheight = 10

-- Maximum width of popup menu
vim.opt.pummaxwidth = 48
vim.opt.fillchars:append({ trunc = "…" })

-- Disable default mode hint (-- INSERT/VISUAL --)
vim.opt.showmode = false

-- Allows neovim to access the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Hide additional tilde at the end of buffer
vim.opt.fillchars:append({ eob = " " })

-- Set all default border to rounded
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"

-- Allow cursor to move where there is no text in visual block mode
vim.opt.virtualedit = "block"

-- Set terminal title
vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = "nvim%{expand('%:t') != '' ? ' '.expand('%:t') : ''}"

-- Disable command line
vim.opt.cmdheight = 0

-- Set cmdline cursor to beam
vim.opt.guicursor:append("c:ver25")

-- Disable mark across different sessions
vim.opt.shada = "!,'0,<50,s10,h,r/tmp/,r/private/"

-- Set number width
vim.opt.numberwidth = 3

-- Enable ui2
require("vim._core.ui2").enable({
    msg = { targets = "msg" }
})

-- Confirm before exiting unsaved file
-- vim.opt.confirm = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use OSC52 if in ssh and not in tmux
if vim.env.SSH_TTY ~= nil and vim.env.TMUX == nil then
    vim.g.clipboard = "osc52"
end
