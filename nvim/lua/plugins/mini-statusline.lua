return {
    "nvim-mini/mini.statusline",
    dependencies = {
        "lewis6991/gitsigns.nvim",
    },
    opts = {
        content = {
            active = function()
                local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                local git = MiniStatusline.section_git({ trunc_width = 40 })
                local diff = MiniStatusline.section_diff({ trunc_width = 75 })
                local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
                local location = "%l:%c"

                local filename = vim.fn.expand('%:t')

                vim.api.nvim_set_hl(0, "MiniStatuslineFilename", {
                    bg = "NONE",
                    ctermbg = "NONE",
                    update = true,
                })
                vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", {
                    bg = "NONE",
                    ctermbg = "NONE",
                    update = true,
                })
                vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", {
                    bg = "NONE",
                    ctermbg = "NONE",
                    update = true,
                })

                return MiniStatusline.combine_groups({
                    { hl = mode_hl,                 strings = { mode } },
                    { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics } },
                    '%<',
                    { hl = 'MiniStatuslineFilename', strings = { filename } },
                    '%=',
                    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                    { hl = mode_hl,                  strings = { search, location } },
                })
            end,
        },
    }
}
