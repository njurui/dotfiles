return {
    "mason-org/mason-lspconfig.nvim",
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
    opts = {
        ensure_installed = {
            "clangd",
            -- "pyright",
            "ruff",
            "rust_analyzer",
            "texlab",
            "superhtml",
            "lua_ls",
            "bashls",
            -- "copilot",
        },
    },
}
