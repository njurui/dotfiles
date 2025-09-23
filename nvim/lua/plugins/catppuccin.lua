return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            auto_integrations = true,
            color_overrides = {
                mocha = {
                    rosewater = "#F0C06A",
                    flamingo  = "#FFC1C6",
                    pink      = "#D9B0FF",
                    mauve     = "#E39AF2",
                    red       = "#FF6E78",
                    maroon    = "#F28B97",
                    peach     = "#FE8F40",
                    yellow    = "#E7C547",
                    green     = "#B3EA54",
                    teal      = "#95E5CB",
                    sky       = "#6FDFFF",
                    sapphire  = "#2C6DA0",
                    blue      = "#90C4FA",
                    lavender  = "#B7E2F8",

                    text      = "#dddddd",

                    subtext1  = "#bbbbbb",
                    subtext0  = "#aaaaaa",

                    overlay2  = "#999999",
                    overlay1  = "#888888",
                    overlay0  = "#777777",

                    surface2  = "#666666",
                    surface1  = "#555555",
                    surface0  = "#444444",

                    base      = "#202020",
                    mantle    = "#222222",
                    crust     = "#333333",
                },
            },
        })
        -- Fix which-key and LSP highlight problem
        vim.cmd [[
            autocmd ColorScheme * highlight NormalFloat guifg=none guibg=none
            autocmd ColorScheme * highlight FloatBorder guifg=none guibg=none
        ]]

        vim.cmd.colorscheme("catppuccin")

        -- Set CursorLine guibg (Used together with kitty)
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#212121" })
        vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#212121" })
        vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "#212121" })
    end,
}
