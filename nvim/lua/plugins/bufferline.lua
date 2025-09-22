return {
    "akinsho/bufferline.nvim",
    dependencies = { 'famiu/bufdelete.nvim', 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    keys = {
        { "<leader>bc", "<cmd>Bdelete!<cr>" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>" },
    },
    opts = {
        options = {
            close_command = "Bdelete! %d",
            separator_style = "thin",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = ""
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or " ")
                    s = s .. sym .. n
                end
                return s
            end,
        },
    }
}
