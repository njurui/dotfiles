return {
    'saghen/blink.pairs',
    build = vim.loop.os_uname().sysname == "Darwin"
        and 'RUSTFLAGS="-C link-arg=-undefined -C link-arg=dynamic_lookup" cargo build --release'
        or 'cargo build --release',

    config = function()
        vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { default = true, fg = '#cc241d', ctermfg = 'Red' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { default = true, fg = '#d65d0e', ctermfg = 'White' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { default = true, fg = '#d79921', ctermfg = 'Yellow' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { default = true, fg = '#689d6a', ctermfg = 'Green' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { default = true, fg = '#a89984', ctermfg = 'Cyan' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { default = true, fg = '#458588', ctermfg = 'Blue' })
        vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { default = true, fg = '#b16286', ctermfg = 'Magenta' })

        require("blink.pairs").setup({
            mappings = {
                -- you can call require("blink.pairs.mappings").enable()
                -- and require("blink.pairs.mappings").disable()
                -- to enable/disable mappings at runtime
                enabled = true,
                cmdline = true,
                -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
                -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
                disabled_filetypes = {},
                -- see the defaults:
                -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
                pairs = {},
            },
            highlights = {
                enabled = true,
                -- requires require('vim._extui').enable({}), otherwise has no effect
                cmdline = true,
                groups = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
                unmatched_group = 'BlinkPairsUnmatched',

                -- highlights matching pairs under the cursor
                matchparen = {
                    enabled = true,
                    -- known issue where typing won't update matchparen highlight, disabled by default
                    cmdline = false,
                    -- also include pairs not on top of the cursor, but surrounding the cursor
                    include_surrounding = false,
                    group = 'BlinkPairsMatchParen',
                    priority = 250,
                },
            },
            debug = false,
        })
    end,
}
