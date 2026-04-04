-- Stop insert when enter an existing terminal from other buffer
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
--     group = vim.api.nvim_create_augroup('NoAutoTerminalInsert', { clear = true }),
--     pattern = 'term://*',
--     callback = function()
--         local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
--         vim.api.nvim_feedkeys(keys, "n", false)
--     end,
-- })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYankText", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Disable comment when enter the newline using 'o'
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NoAutoComment", { clear = true }),
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions
            - "o" -- O and o, don't continue comments
            + "r" -- But do continue when pressing enter.
    end,
})

-- Auto Save
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
    callback = function(ev)
        -- Exclude oil buffers
        local buf = ev.buf
        if vim.bo[buf].filetype == "oil" then
            return
        end

        vim.schedule(function() -- Must use vim.schedule to complete write
            vim.cmd("silent! write")
        end)
    end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("AutoWrap", { clear = true }),
    pattern = { "text", "tex", "plaintex", "typst", "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        -- vim.opt_local.spell = true
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup("AutoCreateDir", { clear = true }),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Treesitter
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("Treesitter", { clear = true }),
    callback = function()
        local fts = require("nvim-treesitter").get_installed()
        if vim.tbl_contains(fts, vim.bo.filetype) then
            -- Treesitter Highlight
            vim.treesitter.start()

            -- Treesitter Folding
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

            -- Treesitter Indent
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

-- Lsp on_attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("OnLspAttach", { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local bufnr = args.buf

        -- Exclude copilot
        if client.name == "copilot" then
            return
        end

        -- Keymap
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "vim.lsp.buf.definition()" })
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "vim.lsp.buf.implementation()" })
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "vim.lsp.buf.references()" })
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "vim.lsp.buf.declaration()" })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "vim.lsp.buf.hover()" })
        vim.keymap.set(
            "n",
            "<C-k>",
            vim.lsp.buf.signature_help,
            { buffer = bufnr, desc = "vim.lsp.buf.signature_help()" }
        )

        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, desc = "vim.lsp.buf.format()" })

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "vim.lsp.buf.rename()" })
        vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            { buffer = bufnr, desc = "vim.lsp.buf.code_action()" }
        )

        -- Highlight symbol under cursor
        if client.server_capabilities.documentHighlightProvider then
            vim.cmd([[
                hi! LspReferenceRead cterm=bold ctermbg=Grey guibg='#5C5C5C'
                hi! LspReferenceText cterm=bold ctermbg=Grey guibg='#5C5C5C'
                hi! LspReferenceWrite cterm=bold ctermbg=Grey guibg='#5C5C5C'
            ]])
            vim.api.nvim_create_augroup("LspDocumentHighlight", {
                clear = false,
            })
            vim.api.nvim_clear_autocmds({
                buffer = bufnr,
                group = "LspDocumentHighlight",
            })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                group = "LspDocumentHighlight",
                buffer = bufnr,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                group = "LspDocumentHighlight",
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
                    border = "rounded",
                    source = "always",
                    scope = "cursor",
                }
                vim.diagnostic.open_float(nil, opts)
            end,
        })
    end,
})
