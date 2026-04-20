return {
    'stevearc/conform.nvim',
    keys = { {
        "<leader>f",
        function()
            require("conform").format({ async = true })
        end,
        desc = "vim.lsp.buf.format()"
    } },
    opts = {
        formatters_by_ft = {
            python = {
                -- To fix auto-fixable lint errors.
                "ruff_fix",
                -- To run the Ruff formatter.
                "ruff_format",
                -- To organize the imports.
                "ruff_organize_imports",
            },
            sh = { "shfmt" },
            bash = { "shfmt" },
            zsh = { "shfmt" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
