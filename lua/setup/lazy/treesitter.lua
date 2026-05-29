return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local languages = {
			"c",
			"cpp",
			"css",
			"go",
			"html",
			"javascript",
			"lua",
			"markdown",
			"markdown_inline",
			"rust",
			"sql",
			"tsx",
			"typescript",
		}

		require("nvim-treesitter").install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"c",
				"cpp",
				"css",
				"go",
				"html",
				"javascript",
				"javascriptreact",
				"lua",
				"markdown",
				"rust",
				"sql",
				"typescript",
				"typescriptreact",
			},
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
