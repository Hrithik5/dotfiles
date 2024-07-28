return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("obsidian").setup({
			dir = "/Users/hrithikchauhan/Documents/Obsidian Vault/", -- default workspace path
			ui = {
				enable = false,
			},
			completion = {
				nvim_cmp = true, -- enable nvim-cmp integration
			},
			daily_notes = {
				folder = "daily", -- folder for daily notes
				date_format = "%Y-%m-%d", -- date format for daily notes
			},
			templates = {
				subdir = "templates", -- subdirectory for templates
				date_format = "%Y-%m-%d-%H%M", -- date format for template files
				time_format = "%H:%M", -- time format for template files
			},
			note_id_func = function(title)
				return title
			end,
			workspaces = {
				{
					name = "personal",
					path = "/Users/hrithikchauhan/Documents/Obsidian Vault/Brain Dump/",
				},
				{
					name = "work",
					path = "/Users/hrithikchauhan/Documents/Obsidian Vault/Notes/",
				},
			},
		})
	end,
}
