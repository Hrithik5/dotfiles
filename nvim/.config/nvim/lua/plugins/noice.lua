return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline",
		},
		messages = {
			enabled = true,
			view = "mini", -- Show messages in a minimal way
			view_error = "mini",
			view_warn = "mini",
		},
		notify = {
			enabled = true,
			view = "mini",
		},
		lsp = {
			progress = {
				enabled = true, -- Enable LSP progress messages in fidget
				format = "lsp_progress",
				view = "mini",
			},
		},
	},
	dependencies = {
		"j-hui/fidget.nvim",
	},
}
