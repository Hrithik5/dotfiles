return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")

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
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			keys = { -- updated from popup_mappings
				scroll_down = "<c-d>",
				scroll_up = "<c-u>",
			},
			win = { -- updated from window
				border = "none",
				position = "bottom",
				margin = { 1, 0, 1, 0 },
				padding = { 1, 2, 1, 2 },
				winblend = 0,
				zindex = 1000,
			},
			defer = { -- updated from operators
				gc = "Comments",
			},
		})

		-- Register key mappings
		wk.register({
			["<leader>"] = {
				name = "File Operations",
				f = { "<cmd>Telescope find_files<cr>", "Find Files" },
				s = { "<cmd>w<cr>", "Save" },
				q = { "<cmd>q<cr>", "Quit" },
			},
			g = {
				name = "Git Operations",
				s = { "<cmd>Git<cr>", "Status" },
				b = { "<cmd>Git blame<cr>", "Blame" },
				c = { "<cmd>Git commit<cr>", "Commit" },
			},
			o = {
				name = "Obsidian",
				n = { "<cmd>ObsidianNewNote<CR>", "New Note" },
				t = { "<cmd>ObsidianToday<CR>", "Today's Note" },
				y = { "<cmd>ObsidianYesterday<CR>", "Yesterday's Note" },
				f = { "<cmd>ObsidianSearch<CR>", "Search Notes" },
				b = { "<cmd>ObsidianBacklinks<CR>", "Backlinks" },
				l = { "<cmd>ObsidianLink<CR>", "Create Link" },
			},
		})
	end,
}
