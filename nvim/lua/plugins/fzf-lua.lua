return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader><space>",
            function()
                require("fzf-lua").files()
            end,
            desc = "Find Files",
        },
        {
            "<leader>/",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "Live Grep",
        },
        {
            "gd",
            function()
                require("fzf-lua").lsp_definitions({ jump1 = true })
            end,
            desc = "LSP Definitions",
        },
        {
            "gi",
            function()
                require("fzf-lua").lsp_implementations({ jump1 = true })
            end,
            desc = "LSP Implementations",
        },
        {
            "gr",
            function()
                require("fzf-lua").lsp_references({ jump1 = true })
            end,
            desc = "LSP References",
        },
        {
            "gD",
            function()
                require("fzf-lua").lsp_declarations({ jump1 = true })
            end,
            desc = "LSP Declarations",
        },
    },
    opts = {
        files = {
            -- previewer = "bat"
        }
    }
}
