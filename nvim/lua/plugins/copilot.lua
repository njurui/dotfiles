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
                    accept = "<C-l>",
                    accept_word = "<C-w>",
                    accept_line = false,
                },
            },
            filetypes = {
                markdown = true,
                ["*"] = true,
            }
        })
    end,
}
