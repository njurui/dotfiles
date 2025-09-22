return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<cr>"),
            dashboard.button("e", "  New file", "<cmd>ene <BAR> startinsert<cr>"),
            -- dashboard.button("p", "󰉋  Find project", "<cmd>Telescope projects<cr>"),
            dashboard.button("r", "  Recently used files", "<cmd>Telescope oldfiles<cr>"),
            dashboard.button("t", "󰦨  Find text", "<cmd>Telescope live_grep<cr>"),
            dashboard.button("q", "  Quit Neovim", "<cmd>qa<CR>"),
        }

        dashboard.section.footer.val = "Take the hits, lick our wounds, and move on."

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
