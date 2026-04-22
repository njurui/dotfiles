return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    keys = {
        { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    },
    lazy = false,
    opts = {
        keymaps = {
            ["<C-c>"] = false,
            ["<Esc>"] = {
                mode = "n",
                callback = function()
                    require("oil").save({ confirm = true }, function(err)
                        if not err then
                            require("oil.actions").close.callback()
                        end
                    end)
                end,
            },
        },
    },
}
