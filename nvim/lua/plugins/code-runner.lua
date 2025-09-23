return {
    "CRAG666/code_runner.nvim",
    dependencies = { 'akinsho/toggleterm.nvim' },
    keys = { { "<leader>rf", "<cmd>RunFile<cr>", desc = "run file" } },
    opts = {
        mode = "toggleterm",
        filetype = {
            javascript = "node",
            java = "cd $dir && javac $fileName && time java $fileNameWithoutExt",
            c =
            -- "cd $dir && clang -g -Wl,-stack_size -Wl,0x10000000 -Wextra -fsanitize=address -Wall -Wsign-compare -Wwrite-strings -Wtype-limits $fileName -o $fileNameWithoutExt && time $dir/$fileNameWithoutExt",
            "cd $dir && clang $fileName -o $fileNameWithoutExt && time $dir/$fileNameWithoutExt",
            cpp =
            "cd $dir && clang++ --std=gnu++26 $fileName -o $fileNameWithoutExt && time $dir/$fileNameWithoutExt",
            python = "time python3 -u",
            typescript = "time deno run",
            sh = "zsh",
            rust = "cd $dir && cargo build && time cargo run",
            markdown =
            "pandoc -f markdown --pdf-engine=xelatex --listings --template eisvogel $fileName -o $fileNameWithoutExt.pdf",
        },
    }
}
