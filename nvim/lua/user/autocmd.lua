-- 进入Terminal 自动进入插入模式
local terGrp = vim.api.nvim_create_augroup("termOpen", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    group = terGrp,
    command = "startinsert",
})

local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

-- 用o换行不要延续注释
local commentGrp = vim.api.nvim_create_augroup("comment", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = commentGrp,
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions
            - "o" -- O and o, don't continue comments
            + "r" -- But do continue when pressing enter.
    end,
})
