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
            "ty",
            "ruff",
            "rust_analyzer",
            "texlab",
            "superhtml",
            "lua_ls",
            "bashls",
            "neocmake",
            "tinymist",
            -- "jq",
            -- "copilot",
            -- "shfmt",
            -- "tectonic",
            -- "latexindent",
        },
    },
}
