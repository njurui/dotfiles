return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', "zbirenbaum/copilot.lua" },
    build = vim.loop.os_uname().sysname == "Darwin"
        and 'RUSTFLAGS="-C link-arg=-undefined -C link-arg=dynamic_lookup" cargo build --release'
        or 'cargo build --release',
    opts = {
        keymap = {
            preset = 'super-tab',
            ['<CR>'] = { 'accept', 'fallback' }
        },

        completion = {
            documentation = {
                auto_show = true,
                window = { border = 'rounded' },
            },
            menu = {
                border = 'rounded',
                draw = {
                    components = {
                        source_name = {
                            text = function(ctx) return "[" .. ctx.source_name .. "]" end,
                        },
                    },
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
                },
            },
            ghost_text = {
                enabled = false,
                -- Show the ghost text when an item has been selected
                show_with_selection = true,
                -- Show the ghost text when no item has been selected, defaulting to the first item
                show_without_selection = false,
                -- Show the ghost text when the menu is open
                show_with_menu = false,
                -- Show the ghost text when the menu is closed
                show_without_menu = true,
            },
        },

        signature = {
            enabled = true,
            trigger = {
                -- Show the signature help automatically
                enabled = true,
                -- Show the signature help window after typing any of alphanumerics, `-` or `_`
                show_on_keyword = false,
                blocked_trigger_characters = {},
                blocked_retrigger_characters = {},
                -- Show the signature help window after typing a trigger character
                show_on_trigger_character = true,
                -- Show the signature help window when entering insert mode
                show_on_insert = true,
                -- Show the signature help window when the cursor comes after a trigger character when entering insert mode
                show_on_insert_on_trigger_character = true,
            },
            window = {
                border = 'rounded',
            },
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        cmdline = {
            keymap = { preset = 'super-tab' },
            completion = { menu = { auto_show = true } },
        },
    },
}
