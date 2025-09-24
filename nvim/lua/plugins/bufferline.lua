return {
    "akinsho/bufferline.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', "folke/snacks.nvim" },
    lazy = false,
    keys = {
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
        { "<C-b>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "Previous buffer" },
        { "<C-f>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Next buffer" },
    },
    opts = {
        options = {
            close_command = "lua Snacks.bufdelete(%d)",
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
                    local sym = e == "error" and "  " or (e == "warning" and " 󰀪 " or "  ")
                    s = s .. sym .. n
                end
                return s
            end,
        },
    }
}
