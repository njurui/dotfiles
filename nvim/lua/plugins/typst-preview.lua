return {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    keys = { { "<leader>tp", "<cmd>TypstPreview<cr>", desc = "Typst preview" } },
    opts = {
        dependencies_bin = {
            ['tinymist'] = 'tinymist',
        },
    },
}
