-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("yank", { clear = true }),
    command = "silent! lua vim.highlight.on_yank()",
})

-- Disable comment when enter the newline using 'o'
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("comment", { clear = true }),
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions
            - "o" -- O and o, don't continue comments
            + "r" -- But do continue when pressing enter.
    end,
})

-- Treesitter highlight
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup("treesitter-highlight", { clear = true }),
    callback = function()
        local fts = require("nvim-treesitter").get_installed()
        if vim.tbl_contains(fts, vim.bo.filetype) then
            vim.treesitter.start()
        end
    end,
})

-- Lsp on_attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        -- Keymap
        vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions,
            { buffer = bufnr, desc = "vim.lsp.buf.definition()" })
        vim.keymap.set("n", "gi", require('telescope.builtin').lsp_implementations,
            { buffer = bufnr, desc = "vim.lsp.buf.implementation()" })
        vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references,
            { buffer = bufnr, desc = "vim.lsp.buf.references()" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "vim.lsp.buf.declaration()" })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "vim.lsp.buf.hover()" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help,
            { buffer = bufnr, desc = "vim.lsp.buf.signature_help()" })

        vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "vim.lsp.buf.rename()" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "vim.lsp.buf.code_action()" })

        -- Highlight symbol under cursor
        if client.server_capabilities.documentHighlightProvider then
            vim.cmd [[
                hi! LspReferenceRead cterm=bold ctermbg=Grey guibg='#5C5C5C'
                hi! LspReferenceText cterm=bold ctermbg=Grey guibg='#5C5C5C'
                hi! LspReferenceWrite cterm=bold ctermbg=Grey guibg='#5C5C5C'
            ]]
            vim.api.nvim_create_augroup('lsp_document_highlight', {
                clear = false
            })
            vim.api.nvim_clear_autocmds({
                buffer = bufnr,
                group = 'lsp_document_highlight',
            })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                group = 'lsp_document_highlight',
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                group = 'lsp_document_highlight',
                buffer = bufnr,
                callback = vim.lsp.buf.clear_references,
            })
        end

        -- Inlay Hint Enabled
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr })
        end

        -- Use LSP-provided folding
        if client.server_capabilities.foldingRangeProvider then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
        end

        -- Show line diagnostics automatically in hover window
        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = 'rounded',
                    source = 'always',
                    scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, opts)
            end
        })
    end
})
