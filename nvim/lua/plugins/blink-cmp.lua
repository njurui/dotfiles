return {
    "saghen/blink.cmp",
    dependencies = {
        {
            "onsails/lspkind.nvim",
            opts = {
                preset = "codicons",
            },
        },
        "nvim-tree/nvim-web-devicons",
        "saghen/blink.lib",
    },
    build = function()
        require('blink.cmp').build():pwait()
    end,

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
                max_height = 12,
                direction_priority = { "s" },
                draw = {
                    gap = 2,
                    columns = {
                        { "kind_icon" },
                        { "label" },
                    },
                    components = {
                        label = {
                            width = { max = 45 },
                            text = function(ctx)
                                local max_width = 45

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
                    max_width = 35,
                    direction_priority = {
                        menu_north = { "e" },
                        menu_south = { "e" },
                    },
                },
            },
        },

        signature = {
            enabled = true,
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
            keymap = {
                preset = "super-tab",
            },
            completion = {
                menu = {
                    auto_show = true,
                    direction_priority = { "n" },
                }
            },
        },
    },
}
