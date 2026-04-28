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
        {
            "<leader>ca",
            function()
                require("fzf-lua").lsp_code_actions({ jump1 = true })
            end,
            desc = "LSP Code Actions",
        },
    },
    opts = {
        grep = {
            no_header_i = true,
            rg_opts = table.concat({
                "--column",
                "--line-number",
                "--no-heading",
                "--color=always",
                "--smart-case",
                "--max-columns=4096",

                "--colors=path:none",
                "--colors=line:none",
                "--colors=column:none",
                -- "--colors=match:none",

                "-e",
            }, " "),
        },
    },
}
