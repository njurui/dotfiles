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
                    accept = false,
                    accept_word = "<C-l>",
                    accept_line = "<C-j>",
                    dismiss = false,
                },
            },
            filetypes = {
                markdown = true,
                ["*"] = true,
            }
        })
    end,
}
