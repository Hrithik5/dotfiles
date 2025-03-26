return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("obsidian").setup({
			dir = "/Users/hrithikchauhan/Documents/Obsidian Vault/", -- default workspace path
			completion = {
				nvim_cmp = true, -- enable nvim-cmp integration
			},
			daily_notes = {
				folder = "daily", -- folder for daily notes
				date_format = "%Y-%m-%d", -- date format for daily notes
			},
			templates = {
				folder = "/Users/hrithikchauhan/Documents/Obsidian Vault/NotesTemplates/",
				date_format = "%Y-%m-%d-%H%M", -- date format for template files
				time_format = "%H:%M", -- time format for template files
			},
			note_id_func = function(title)
				return title
			end,
			workspaces = {
				{
					name = "Daily",
					path = "/Users/hrithikchauhan/Documents/Obsidian Vault/Daily",
				},
				{
					name = "Work",
					path = "/Users/hrithikchauhan/Documents/Obsidian Vault/Work",
				},
				{
					name = "Notes",
					path = "/Users/hrithikchauhan/Documents/Obsidian Vault/Notes",
				},
			},
		})

		-- Keymaps for Obsidian
		vim.api.nvim_set_keymap("n", "<leader>on", ":ObsidianNewNote<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ot", ":ObsidianToday<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>oy", ":ObsidianYesterday<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ob", ":ObsidianBacklinks<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ol", ":ObsidianLink<CR>", { noremap = true, silent = true })
	end,
}
