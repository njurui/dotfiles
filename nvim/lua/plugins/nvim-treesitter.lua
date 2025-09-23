return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').install({ 'stable', 'unstable' })
    end,
}
