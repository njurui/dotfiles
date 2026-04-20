return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    keys = { { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Outline" } },
    opts = {
        backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        filter_kind = false,
    },
}
