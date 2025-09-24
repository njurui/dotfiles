return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', "copilotlsp-nvim/copilot-lsp", "fang2hou/blink-copilot" },
    build = vim.loop.os_uname().sysname == "Darwin"
        and 'RUSTFLAGS="-C link-arg=-undefined -C link-arg=dynamic_lookup" cargo build --release'
        or 'cargo build --release',
    opts = {
        keymap = {
            preset = 'super-tab',
            ["<Tab>"] = {
                function(cmp)
                    if vim.b[vim.api.nvim_get_current_buf()].nes_state then
                        cmp.hide()
                        return (
                            require("copilot-lsp.nes").apply_pending_nes()
                            and require("copilot-lsp.nes").walk_cursor_end_edit()
                        )
                    end
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                "snippet_forward",
                "fallback",
            },
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
                enabled = true,
                -- Show the ghost text when an item has been selected
                show_with_selection = true,
                -- Show the ghost text when no item has been selected, defaulting to the first item
                show_without_selection = false,
                -- Show the ghost text when the menu is open
                show_with_menu = true,
                -- Show the ghost text when the menu is closed
                show_without_menu = true,
            },
        },

        signature = {
            enable = true,
            window = {
                border = 'rounded',
            },
        },

        sources = {
            default = { "copilot", 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                copilot = {
                    name = "Copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },

        cmdline = {
            keymap = { preset = 'inherit' },
            completion = { menu = { auto_show = true } },
        },
    },
}
