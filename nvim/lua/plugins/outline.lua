return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" } },
	dependencies = {
		"onsails/lspkind.nvim",
	},
	opts = {
		symbol_folding = {
			-- Depth past which nodes will be folded by default. Set to false to unfold all on open.
			autofold_depth = false,
		},
		symbols = {
			icon_source = "lspkind",
		},
	},
}
