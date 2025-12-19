vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
    virtual_lines = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.keymap.set('n', 'gK', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=google",
    },
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        -- fallbackFlags = { '-std=gnu++23' },
    },
    -- flags = { allow_incremental_sync = false },
})

vim.lsp.config("ruff", {
    init_options = {
        settings = {
            lineLength = 320
        }
    }
})

vim.lsp.config("bashls", {
    filetypes = { "bash", "zsh", "sh" },
})

vim.lsp.config("tinymist", {
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onType",
        -- Execute the command to generate database: tinymist compile --save-lock main.typ
        projectResolution = "lockDatabase",
    },
})

vim.lsp.config("texlab", {
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = {
                    "-pdf",
                    "-pdflatex",
                    "-shell-escape",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                    "%f",
                },

                -- executable = "tectonic",
                -- args = {
                --     "-X",
                --     "compile",
                --     "%f",
                --     "--synctex",
                --     "--keep-logs",
                --     "--keep-intermediates"
                -- },
                forwardSearchAfter = true,
                onSave = true,
            },
            forwardSearch = {
                executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                args = { "-g", "%l", "%p", "%f" },
            },
            -- chktex = {
            --     onEdit = true,
            --     onOpenAndSave = true,
            -- },
            latexindent = {
                modifyLineBreaks = true,
            },
        },
    },
})

-- Use Mason bundled texlab to support inverse search
-- Skim config:
-- Commands: $HOME/.local/share/nvim/mason/bin/texlab
-- Arguments: inverse-search -i "%file" -l %line
-- vim.lsp.enable("texlab")
