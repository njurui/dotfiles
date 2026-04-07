return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "A┃" },
            change = { text = "C┃" },
            delete = { text = "D_" },
            topdelete = { text = "D‾" },
            changedelete = { text = "D~" },
            untracked = { text = "U┆" },
        },
        signs_staged = {
            add = { text = "A┃" },
            change = { text = "C┃" },
            delete = { text = "D_" },
            topdelete = { text = "D‾" },
            changedelete = { text = "D~" },
            untracked = { text = "U┆" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame = true,
        current_line_blame_opts = {
            delay = 200,
            use_focus = false,
        },
        current_line_blame_formatter = "    <author>, <author_time:%R> • <summary>",
        current_line_blame_formatter_nc = "    You • Uncommitted changes",

        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            -- Navigation
            vim.keymap.set("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end, { buffer = bufnr, desc = "Next hunk" })

            vim.keymap.set("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end, { buffer = bufnr, desc = "Previous hunk" })
        end,
    },
}
