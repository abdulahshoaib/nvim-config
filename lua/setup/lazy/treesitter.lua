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

		local parsers = require("nvim-treesitter.parsers")
		parsers.ft_to_lang = vim.treesitter.language.get_lang
		parsers.get_parser = function(bufnr, lang)
			return vim.treesitter.get_parser(bufnr, lang)
		end

		package.loaded["nvim-treesitter.configs"] = {
			is_enabled = function(module)
				return module == "highlight"
			end,
			get_module = function(module)
				if module == "highlight" then
					return {
						additional_vim_regex_highlighting = false,
					}
				end
				return {}
			end,
		}

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
