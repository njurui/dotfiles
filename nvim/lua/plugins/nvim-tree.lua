return {
    "nvim-tree/nvim-tree.lua",
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" } },
    opts = {
        filters = { custom = { "^.git$" }, },
    },
}
