return {
    "nvim-tree/nvim-tree.lua",
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" } },
    opts = {
        filters = { custom = { "^.git$" }, },
        update_focused_file = {
            enable = true,
            update_root = {
                enable = true,
            },
        },
    },
}
