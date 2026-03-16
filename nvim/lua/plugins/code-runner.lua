return {
    "CRAG666/code_runner.nvim",
    keys = { { "<leader>rf", "<cmd>RunFile<cr>", desc = "run file" } },
    opts = {
        focus = false,
        filetype = {
            javascript = "node",
            typescript = "time deno run",
            c =
            -- "cd $dir && clang -g -Wl,-stack_size -Wl,0x10000000 -Wextra -fsanitize=address -Wall -Wsign-compare -Wwrite-strings -Wtype-limits $fileName -o $fileNameWithoutExt && time $dir/$fileNameWithoutExt",
            "cd $dir && clang $fileName -o $fileNameWithoutExt && time $dir/$fileNameWithoutExt",
            cpp = "cd $dir && clang++ --std=gnu++26 $fileName -o $fileNameWithoutExt && time $dir/$fileNameWithoutExt",
            python = "time python3 -u",
            rust = "cd $dir && cargo build && time cargo run",
        },
    },
}
