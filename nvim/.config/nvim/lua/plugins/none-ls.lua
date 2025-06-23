return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local none_ls = require("null-ls")

		-- Utility function to check if a binary exists
		local function has_bin(bin)
			return vim.fn.executable(bin) == 1
		end

		local sources = {
			-- Always included formatters
			none_ls.builtins.formatting.stylua,
			none_ls.builtins.formatting.black,
			none_ls.builtins.formatting.isort,
			none_ls.builtins.formatting.yamlfix,
			none_ls.builtins.formatting.goimports_reviser,
			none_ls.builtins.formatting.golines,
			none_ls.builtins.formatting.gofumpt,

			-- Completion
			none_ls.builtins.completion.spell,
		}

		-- Conditionally load eslint_d if available
		if has_bin("eslint_d") then
			table.insert(sources, none_ls.builtins.formatting.eslint_d)
			table.insert(sources, none_ls.builtins.diagnostics.eslint_d)
		end

		-- Conditionally load prettier if available
		if has_bin("prettier") then
			table.insert(sources, none_ls.builtins.formatting.prettier)
		end

		none_ls.setup({
			sources = sources,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Code" })
	end,
}
