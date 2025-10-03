return {
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"Skardyy/makurai-nvim",
		config = function()
			require("makurai").setup({
				transparent = true, -- removes the bg color
				bordered = true, -- removes the bg color from floats/popups
				increase_contrast = true, -- only changes the line number and active line number for now.
			})

			vim.cmd.colorscheme("makurai_dark")
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = true,
				terminal_colors = true,
				styles = {
					sidebar = "dark",
					float = "dark",
				},
			})

			-- vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
}
