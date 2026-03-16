return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
        focus = true, -- Focus the window when opened
        keys = {
            gb = false,
            s = false,
        },
    },
    keys = {
        {
            "<leader>x",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
