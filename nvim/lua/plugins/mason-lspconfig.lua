return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "clangd",
            "pyright",
            "ruff",
            "rust_analyzer",
            "texlab",
            "superhtml",
            "lua_ls",
            "copilot",
        },
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    border = 'rounded',
                },
            },
        },
        "neovim/nvim-lspconfig",
    },
}
