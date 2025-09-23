return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",    -- latte, frappe, macchiato, mocha
            no_italic = false,    -- Force no italic
            no_bold = false,      -- Force no bold
            no_underline = false, -- Force no underline
            transparent_background = true,
            auto_integrations = true,
            color_overrides = {
                mocha = {
                    rosewater = "#ffc0b9",
                    flamingo = "#f5aba3",
                    pink = "#f592d6",
                    -- mauve = "#c0afff",
                    red = "#ea746c",
                    maroon = "#ff8595",
                    peach = "#fa9a6d",
                    yellow = "#ffe081",
                    green = "#99d783", -- include
                    teal = "#47deb4",
                    sky = "#00d5ed",
                    sapphire = "#00dfce",
                    -- blue = "#00baee",     -- function
                    lavender = "#a984bd", -- member

                    text = "#dddddd",

                    subtext1 = "#bbbbbb",
                    subtext0 = "#aaaaaa",

                    overlay2 = "#999999",
                    overlay1 = "#888888",
                    overlay0 = "#777777",

                    surface2 = "#666666",
                    surface1 = "#555555",
                    surface0 = "#444444",

                    base = "#202020",
                    mantle = "#222222",
                    crust = "#333333",

                    -- base = "#000000",
                    -- mantle = "#000000",
                    -- crust = "#000000",
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
