vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
    },
    virtual_lines = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--fallback-style=Google",
    },
    init_options = {
        clangdFileStatus = true,
    },
})

vim.lsp.config("ruff", {
    init_options = {
        settings = {
            lineLength = 320,
        },
    },
})

vim.lsp.config("tinymist", {
    root_markers = { "tinymist.lock" },
    settings = {
        formatterMode = "typstyle",
        exportPdf = "onType",
        outputPath = "$root/build/$name",
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
                    "-outdir=build",
                    "-auxdir=build",
                    "%f",
                },
                onSave = true,
                forwardSearchAfter = false,
                auxDirectory = "build",
                logDirectory = "build",
                pdfDirectory = "build",
            },
            forwardSearch = {
                -- Sioyek config:
                -- executable = "sioyek",
                -- args = {
                -- 	"--nofocus",
                -- 	"--reuse-window",
                -- 	"--execute-command",
                -- 	"toggle_synctex",
                -- 	"--inverse-search",
                -- 	'texlab inverse-search -i "%%1" -l %%2',
                -- 	"--forward-search-file",
                -- 	"%f",
                -- 	"--forward-search-line",
                -- 	"%l",
                -- 	"%p",
                -- },
            },
            formatterLineLength = 255,
            latexFormatter = "tex-fmt",
        },
    },
})

-- "tex-fmt"
-- "shfmt"
vim.lsp.enable("clangd")
vim.lsp.enable("texlab")
vim.lsp.enable("ruff")
vim.lsp.enable("ty")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("superhtml")
vim.lsp.enable("lua_ls")
vim.lsp.enable("neocmake")
vim.lsp.enable("jsonls")
vim.lsp.enable("tombi")
vim.lsp.enable("lemminx")
vim.lsp.enable("vtsls")
vim.lsp.enable("yamlls")
vim.lsp.enable("tinymist")
