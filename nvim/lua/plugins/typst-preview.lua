return {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    keys = { { "<leader>tp", "<cmd>TypstPreview<cr>", desc = "Typst preview" } },
    opts = {
        dependencies_bin = {
            ['tinymist'] = 'tinymist',
        },
        get_main_file = function(path_of_buffer)
            return vim.fn.findfile("main.typ", vim.fn.fnamemodify(path_of_buffer, ":p:h") .. ";")
        end,
    },
}
