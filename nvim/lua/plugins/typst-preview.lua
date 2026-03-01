return {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    keys = { { "<leader>tp", "<cmd>TypstPreview<cr>", desc = "Typst preview" } },
    opts = {
        -- port = 23635,
        open_cmd = "firefox %s", -- Use Firefox to avoid lagging
        dependencies_bin = {
            ["tinymist"] = "tinymist",
        },
        get_main_file = function(path_of_buffer)
            local main = vim.fn.findfile("main.typ", vim.fn.fnamemodify(path_of_buffer, ":p:h") .. ";")
            return main ~= "" and main or path_of_buffer
        end,
    },
}
