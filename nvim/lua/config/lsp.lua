vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
    virtual_lines = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.keymap.set('n', 'gK', function()
    local new_config = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

vim.lsp.config("clangd", {
    -- root_dir = function(fname)
    --     return require("lspconfig.util").root_pattern(
    --         "Makefile",
    --         "configure.ac",
    --         "configure.in",
    --         "config.h.in",
    --         "meson.build",
    --         "meson_options.txt",
    --         "build.ninja"
    --     )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
    --         fname
    --     ) or require("lspconfig.util").find_git_ancestor(fname)
    -- end,
    cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=google",
    },
    init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        -- fallbackFlags = { '--std=c++23' },
    },
    flags = { allow_incremental_sync = false },
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
