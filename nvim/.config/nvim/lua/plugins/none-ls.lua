return {
	"jose-elias-alvarez/null-ls.nvim", -- Correct plugin name (was "none-ls.nvim")
	event = "VeryLazy",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatting
				null_ls.builtins.formatting.eslint_d, -- Use either eslint_d OR eslint, not both
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.yamlfix,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.gofumpt,

				-- Diagnostics (moved to proper section)
				null_ls.builtins.diagnostics.eslint_d, -- Use builtin instead of require

				-- Completion
				null_ls.builtins.completion.spell,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Code" })
	end,
}
