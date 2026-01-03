return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                enabled = false,
            },
        },
        prompt = {
            enabled = true,
        },
    },
    keys = {
        { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
        { "r", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
    },
}
