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
			dir = "/Users/hrithikchauhan/Obsidian/Notes", -- default workspace path
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
					path = "/Users/hrithikchauhan/Obsidian/Notes/personal",
				},
				{
					name = "work",
					path = "/Users/hrithikchauhan/Obsidian/Notes/work",
				},
				{
					name = "study",
					path = "/Users/hrithikchauhan/Obsidian/Notes/study",
				},
			},
		})

		-- Keymaps for Obsidian
		vim.api.nvim_set_keymap(
			"n",
			"<leader>on",
			":ObsidianNewNote<CR>",
			{ noremap = true, silent = true, desc = "ObsidianNewNote" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ot",
			":ObsidianToday<CR>",
			{ noremap = true, silent = true, desc = "ObsidianToday" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>oy",
			":ObsidianYesterday<CR>",
			{ noremap = true, silent = true, desc = "ObsidianYesterday" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>of",
			":ObsidianSearch<CR>",
			{ noremap = true, silent = true, desc = "ObsidianSearch" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ob",
			":ObsidianBacklinks<CR>",
			{ noremap = true, silent = true, desc = "ObsidianBacklinks" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ol",
			":ObsidianLink<CR>",
			{ noremap = true, silent = true, desc = "ObsidianLink" }
		)
	end,
}
