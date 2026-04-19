return {
    'stevearc/aerial.nvim',
    opts = {
        backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        filter_kind = false,
    },
    keys = { { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Outline" } },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
}
