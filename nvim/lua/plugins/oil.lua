return {
    'stevearc/oil.nvim',
    keys = {
        {
            "<leader>e",
            function()
                if vim.bo.filetype == 'oil' then
                    require("oil.actions").close.callback()
                else
                    vim.cmd('Oil')
                end
            end,
            desc = "Toggle Explorer"
        },
    },
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
}
