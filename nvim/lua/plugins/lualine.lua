return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            disabled_filetypes = {
                statusline = { "alpha" },
                winbar = { "*" },
            },
        },
        sections = {
            lualine_x = {
                "encoding",
                {
                    'fileformat',
                    symbols = {
                        unix = 'LF',
                        dos = 'CRLF',
                        mac = 'CR',
                    }
                },
                "filetype",
            },
        },
        extensions = { "nvim-tree", "toggleterm", "symbols-outline", "lazy", "mason" },
    }
}
