return {
	"j-hui/fidget.nvim",
	event = "VeryLazy",
	opts = {
		progress = {
			display = {
				render_limit = 5,
				done_ttl = 3,
				done_icon = "✔",
				done_style = "Constant",
				-- Icon shown when LSP progress tasks are in progress
				progress_icon = { "dots" },
				-- Highlight group for in-progress LSP tasks
				progress_style = "WarningMsg",
			},
		},
		notification = {
			override_vim_notify = true, -- Override default Vim notifications with fidget

			view = {
				stack_upwards = true, -- Display notification items from bottom to top
				icon_separator = " ", -- Separator between group name and icon
				group_separator = "---", -- Separator between notification groups
				-- Highlight group used for group separator
				group_separator_hl = "Comment",
				-- How to render notification messages
				render_message = function(msg, cnt)
					return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
				end,
			},
		},
	},
}
