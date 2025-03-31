return {
	"nvimtools/none-ls.nvim",
  event = "VeryLazy",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local none_ls = require("none-ls")
		none_ls.setup({
			sources = {
				-- Formatting
				none_ls.builtins.formatting.eslint_d,
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.black,
				none_ls.builtins.formatting.isort,
				none_ls.builtins.formatting.yamlfix,
				none_ls.builtins.formatting.prettier,
				none_ls.builtins.formatting.goimports_reviser,
				none_ls.builtins.formatting.golines,
				none_ls.builtins.formatting.gofumpt,

				-- Diagnostics
				none_ls.builtins.diagnostics.eslint_d,

				-- Completion
				none_ls.builtins.completion.spell,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Code" })
	end,
}

