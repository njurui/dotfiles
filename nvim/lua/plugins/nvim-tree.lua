return {
    "nvim-tree/nvim-tree.lua",
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" } },
    config = function()
        vim.api.nvim_set_hl(0, "NvimTreeDiagnosticErrorFileHL", { link = "DiagnosticError" })
        vim.api.nvim_set_hl(0, "NvimTreeDiagnosticWarnFileHL", { link = "DiagnosticWarn" })
        vim.api.nvim_set_hl(0, "NvimTreeDiagnosticInfoFileHL", { link = "DiagnosticInfo" })
        vim.api.nvim_set_hl(0, "NvimTreeDiagnosticHintFileHL", { link = "DiagnosticHint" })

        require("nvim-tree").setup({
            view = {
                signcolumn = "no",
            },
            renderer = {
                root_folder_label = false,
                highlight_diagnostics = "name",
                icons = {
                    git_placement = "right_align",
                    show = {
                        diagnostics = false,
                    },
                    glyphs = {
                        git = {
                            unstaged = "M",  -- modified
                            staged = "S",    -- staged
                            unmerged = "!",  -- conflict
                            renamed = "R",   -- renamed
                            untracked = "U", -- untracked
                            deleted = "D",   -- deleted
                            ignored = "",
                        },
                    },
                },
            },
            update_focused_file = {
                enable = true,
                update_root = {
                    enable = true,
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                icons = {
                    hint = "󰌶 ",
                    info = " ",
                    warning = "󰀪 ",
                    error = "󰅚 ",
                },
            },
            filters = { custom = { "^.git$" }, },
        })
    end,
}
