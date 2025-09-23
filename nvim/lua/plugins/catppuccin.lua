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
                    sky       = "#6FEFFF",
                    sapphire  = "#2C6DA0",
                    blue      = "#5CAFFF",
                    lavender  = "#B7E2F8",

                    text      = "#E0DED8",
                    subtext1  = "#BBB8B1",
                    subtext0  = "#96938E",

                    overlay2  = "#7F7F7A",
                    overlay1  = "#686965",
                    overlay0  = "#51524F",

                    surface2  = "#2B2D33",
                    surface1  = "#1F2127",
                    surface0  = "#181B20",

                    base      = "#14161A",
                    mantle    = "#0B0E12",
                    crust     = "#000000",
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
