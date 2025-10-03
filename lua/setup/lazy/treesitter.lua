return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    event = {"BufReadPost", "BufNewFile"},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "markdown", "markdown_inline", "cpp" },
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
