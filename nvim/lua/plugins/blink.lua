return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', "copilotlsp-nvim/copilot-lsp", "fang2hou/blink-copilot" },
    build = 'RUSTFLAGS="-C link-arg=-undefined -C link-arg=dynamic_lookup" cargo build --release',
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
        },

        signature = {
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
    },
}
