return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = true,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<C-y>",
                    accept_line = "<C-j>",
                    accept_word = "<C-l>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                markdown = true,
                ["*"] = true,
            }
        })
    end,
}
