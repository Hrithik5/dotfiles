return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

		-- Setup WhichKey with your current settings
		wk.setup({
			plugins = {
				marks = true,
				registers = true,
				presets = {
					operators = true,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			operators = {
				gc = "Comments",
			},
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			popup_mappings = {
				scroll_down = "<c-d>",
				scroll_up = "<c-u>",
			},
			window = {
				border = "none",
				position = "bottom",
				margin = { 1, 0, 1, 0 },
				padding = { 1, 2, 1, 2 },
				winblend = 0,
				zindex = 1000,
			},
		})

		-- Further customization or additions can go here
		-- For example:
		-- wk.register({
		--   ["<leader>f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
		--   ["<leader>g"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		-- })
		-- Additional key mappings
		-- wk.register({
		--   ["<leader>f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
		--   ["<leader>g"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		--   ["<leader>c"] = { "<cmd>TodoTelescope<cr>", "Search Todos" },
		-- })
		--
		-- -- Example of grouping key mappings
		-- wk.register({
		--   ["<leader>"] = {
		--     name = "File Operations",
		--     f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		--     s = { "<cmd>w<cr>", "Save" },
		--     q = { "<cmd>q<cr>", "Quit" },
		--   },
		--   ["<leader>g"] = {
		--     name = "Git Operations",
		--     s = { "<cmd>Git<cr>", "Status" },
		--     b = { "<cmd>Git blame<cr>", "Blame" },
		--     c = { "<cmd>Git commit<cr>", "Commit" },
		--   },
		-- })
	end,
}
