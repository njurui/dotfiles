return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = { { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" } },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,                    -- neo-tree will lazily load itself
    opts = {
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "",     -- or "" to use 'winborder' on Neovim v0.11+
        filesystem = {
            filtered_items = {
                visible = true,
            },
            follow_current_file = {
                enabled = true,
            },
        },
    }
}
