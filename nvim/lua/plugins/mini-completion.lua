return {
    "nvim-mini/mini.completion",
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        {
            "onsails/lspkind.nvim",
            opts = {
                preset = "codicons",
            },
        },
        {
            'antonk52/filepaths_ls.nvim',
            config = function()
                vim.lsp.enable('filepaths_ls')
            end,
        }
    },
    config = function()
        -- Add padding trailing kind icon
        local kinds = vim.lsp.protocol.CompletionItemKind
        for i, kind in ipairs(kinds) do
            if type(kind) == "string" and kind ~= "" then
                kinds[i] = kind .. " "
            end
        end

        local kind_names = {}
        for name, id in pairs(vim.lsp.protocol.CompletionItemKind) do
            if type(name) == "string" and type(id) == "number" then
                kind_names[id] = name
            end
        end

        local function process_items(items, base)
            items = MiniCompletion.default_process_items(items, base)

            for _, item in ipairs(items) do
                -- fallback kind
                if kind_names[item.kind] == nil then
                    item.kind = kinds.Field
                end

                local details = item.labelDetails or {}
                local label = item.label or ""
                local detail = details.detail or ""
                local abbr = label .. detail

                item.label = abbr
                item.labelDetails = nil
            end

            -- Add highlight color to kind icon
            for _, item in ipairs(items) do
                local kind = kind_names[item.kind]
                if kind ~= nil then
                    item.kind_hlgroup = "CmpItemKind" .. kind
                end
            end

            return items
        end

        -- Setup
        require("mini.completion").setup({
            lsp_completion = {
                process_items = process_items,
            },
            delay = { completion = 0, info = 0, signature = 0 },
            window = {
                info = { height = 25, width = 35, border = "rounded" },
                signature = { height = 25, width = 80, border = "rounded" },
            },
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = {
                "MiniCompletionWindowOpen",
                "MiniCompletionWindowUpdate",
            },
            callback = function(args)
                local win_id = args.data.win_id

                -- Remove the 'Info' and 'Signature' window id
                if win_id and vim.api.nvim_win_is_valid(win_id) then
                    vim.api.nvim_win_set_config(win_id, { title = "" })
                end

                if args.data.kind ~= "info" then
                    return
                end

                -- Close info window if there's no info
                local first_line = vim.api.nvim_buf_get_lines(
                    vim.api.nvim_win_get_buf(win_id),
                    0,
                    1,
                    false
                )[1]
                if first_line == "-No-info-" then
                    vim.api.nvim_win_close(win_id, true)
                end
            end,
        })

        -- Remove menu 'S' of the snippet completion item
        local completefunc_lsp = MiniCompletion.completefunc_lsp
        MiniCompletion.completefunc_lsp = function(findstart, base)
            local res = completefunc_lsp(findstart, base)
            if type(res) == "table" then
                for _, item in ipairs(res) do
                    item.menu = ""
                end
            end
            return res
        end

        -- Remove signature help underline and use v-block style
        vim.api.nvim_set_hl(0, "MiniCompletionActiveParameter", { link = "Visual" })

        -- Keymap
        vim.keymap.set("i", "<Tab>", function()
            -- Accept
            if vim.fn.complete_info({ "selected" }).selected ~= -1 then
                return "\25"
            end

            if vim.fn.pumvisible() == 1 then
                return "<C-n>"
            end

            -- fallback to vim.snippet
            if vim.snippet and vim.snippet.active({ direction = 1 }) then
                vim.snippet.jump(1)
                return ""
            end

            return "<Tab>"
        end, { expr = true, desc = "Super Tab" })

        vim.keymap.set("i", "<S-Tab>", function()
            if vim.fn.pumvisible() == 1 then
                return "<C-p>"
            end

            -- fallback to vim.snippet
            if vim.snippet and vim.snippet.active({ direction = -1 }) then
                vim.snippet.jump(-1)
                return ""
            end

            return "<S-Tab>"
        end, { expr = true, desc = "Super Shift-Tab" })

        vim.keymap.set("i", "<CR>", function()
            if vim.fn.complete_info({ "selected" }).selected ~= -1 then
                return "\25"
            end

            return require("nvim-autopairs").autopairs_cr()
            -- replace_keycodes is needed for autopairs_cr
        end, { expr = true, replace_keycodes = false, silent = true })
    end,
}
