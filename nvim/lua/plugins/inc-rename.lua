return {
    "smjonas/inc-rename.nvim",
    keys = { {
        "<leader>rn",
        function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "vim.lsp.buf.rename()"
    } },
    opts = {}
}
