return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
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
	config = function(_, opts)
		-- Configure Trouble
		require("trouble").setup(opts)

		-- Telescope integration with Trouble
		local trouble_telescope = require("trouble.sources.telescope")
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble_telescope.open }, -- Insert mode mapping
					n = { ["<c-t>"] = trouble_telescope.open }, -- Normal mode mapping
				},
			},
		})
	end,
}
