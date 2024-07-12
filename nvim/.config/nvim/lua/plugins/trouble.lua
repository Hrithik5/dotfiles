return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		position = "bottom",
		icons = true,
		padding = true,
		fold_open = "",
		fold_closed = "",
		use_diagnostic_signs = true,
		action_keys = {
			close = { "q", "<esc>" },
			cancel = "<c-e>",
			refresh = "r",
			next = "j",
			help = "?", -- help menu
		},
		signs = {
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "",
		},
	},
	config = function()
		local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble.open_with_trouble },
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
			},
		})
	end,
}
