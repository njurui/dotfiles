return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			disabled_filetypes = {
				statusline = { "snacks_dashboard" },
				winbar = { "*" },
			},
		},
		sections = {
			lualine_b = {
				{
					"branch",
					icon = "",
				},
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
				},
				"diagnostics",
			},
			lualine_x = {
				"encoding",
				{
					"fileformat",
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
				"filetype",
			},
		},
		extensions = { "symbols-outline", "lazy", "mason", "oil" },
	},
}
