return {
    "Bekaboo/dropbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        symbol = {
            on_click = false,
        },
        bar = {
            enable = function(buf, win, _)
                if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_win_is_valid(win) then
                    return false
                end

                if vim.api.nvim_win_get_config(win).relative ~= "" then
                    return false
                end

                local ft = vim.bo[buf].filetype
                if vim.fn.win_gettype(win) ~= '' or vim.wo[win].winbar ~= "" or ft == "help" or ft == "" then
                    return false
                end

                return pcall(vim.treesitter.get_parser, buf)
                    or not vim.tbl_isempty(vim.lsp.get_clients({
                        bufnr = buf,
                        method = "textDocument/documentSymbol",
                    }))
            end,
        },
        icons = {
            kinds = {
                symbols = {
                    Array = "󰅪 ",
                    BlockMappingPair = "󰅩 ",
                    Boolean = " ",
                    BreakStatement = "󰙧 ",
                    Call = "󰃷 ",
                    CaseStatement = "󱃙 ",
                    Class = " ",
                    Color = " ",
                    Constant = " ",
                    Constructor = " ",
                    ContinueStatement = "→ ",
                    Copilot = " ",
                    Declaration = "󰙠 ",
                    Delete = "󰩺 ",
                    DoStatement = "󰑖 ",
                    Element = "󰅩 ",
                    Enum = " ",
                    EnumMember = " ",
                    Event = " ",
                    Field = " ",
                    File = "󰈔 ",
                    Folder = "󰉋 ",
                    ForStatement = "󰑖 ",
                    Function = " ",
                    GotoStatement = "󰁔 ",
                    Identifier = " ",
                    IfStatement = "󰇉 ",
                    Interface = " ",
                    Keyword = " ",
                    List = "󰅪 ",
                    Log = "󰦪 ",
                    Lsp = " ",
                    Macro = "󰁌 ",
                    MarkdownH1 = "󰉫 ",
                    MarkdownH2 = "󰉬 ",
                    MarkdownH3 = "󰉭 ",
                    MarkdownH4 = "󰉮 ",
                    MarkdownH5 = "󰉯 ",
                    MarkdownH6 = "󰉰 ",
                    Method = "󰆧 ",
                    Module = "󰏗 ",
                    Namespace = "󰅩 ",
                    Null = "󰢤 ",
                    Number = "󰎠 ",
                    Object = "󰅩 ",
                    Operator = "󰆕 ",
                    Package = " ",
                    Pair = "󰅪 ",
                    Property = " ",
                    Reference = "󰦾 ",
                    Regex = " ",
                    Repeat = "󰑖 ",
                    Return = "󰌑 ",
                    Rule = "󰅩 ",
                    RuleSet = "󰅩 ",
                    Scope = "󰅩 ",
                    Section = "󰅩 ",
                    Snippet = "󰩫 ",
                    Specifier = "󰦪 ",
                    Statement = "󰅩 ",
                    String = "󰉾 ",
                    Struct = " ",
                    SwitchStatement = "󰺟 ",
                    Table = "󰅩 ",
                    Terminal = " ",
                    Text = " ",
                    Type = " ",
                    TypeParameter = "󰆩 ",
                    Unit = " ",
                    Value = "󰎠 ",
                    Variable = " ",
                    WhileStatement = "󰑖 ",
                },
            },
        },
    },
}
