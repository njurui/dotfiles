return {
    'stevearc/aerial.nvim',
    dependencies = {
        {
            "onsails/lspkind.nvim",
            opts = {
                preset = "codicons",
            },
        },
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = { { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Outline" } },
    opts = {
        backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        filter_kind = false,
        show_guides = true,
    },
}
