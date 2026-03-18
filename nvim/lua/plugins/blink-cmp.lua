return {
    "saghen/blink.cmp",
    dependencies = {
        {
            "onsails/lspkind.nvim",
            opts = {
                preset = "codicons",
            },
        },
    },
    build = vim.loop.os_uname().sysname == "Darwin"
        and 'RUSTFLAGS="-C link-arg=-undefined -C link-arg=dynamic_lookup" cargo build --release'
        or "cargo build --release",
    opts = {
        keymap = {
            preset = "super-tab",
            ["<CR>"] = { "accept", "fallback" },
        },

        completion = {
            list = {
                selection = {
                    auto_insert = false,
                },
            },
            menu = {
                -- min_width = 45,
                max_height = 12,
                border = "rounded",
                draw = {
                    gap = 2,
                    columns = {
                        { "kind_icon" },
                        { "label" },
                    },
                    components = {
                        label = {
                            width = { max = 60 },
                            text = function(ctx)
                                local max_width = 60

                                local base = (ctx.label or "") .. (ctx.label_detail or "")
                                if #base >= max_width - 1 then
                                    return base
                                end

                                local desc = ctx.label_description or ""
                                if desc == "" then
                                    return base
                                end

                                local desc_width = math.min(#desc, max_width - #base - 1)
                                local spaces = max_width - #base - desc_width
                                return base .. string.rep(" ", spaces) .. desc
                            end,
                        },
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require("lspkind").symbolic(ctx.kind, {
                                        mode = "symbol",
                                    })
                                end
                                return icon .. ctx.icon_gap
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                update_delay_ms = 50,
                window = {
                    max_width = 50,
                    border = "rounded",
                },
            },
            ghost_text = {
                enabled = false,
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
                border = "rounded",
            },
        },

        fuzzy = {
            sorts = {
                "exact",
                "score",
                "sort_text",
                "kind",
                "label",
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            providers = {
                snippets = {
                    opts = {
                        friendly_snippets = false,
                    },
                },
            },
        },

        cmdline = {
            keymap = { preset = "super-tab" },
            completion = { menu = { auto_show = true } },
        },
    },
}
