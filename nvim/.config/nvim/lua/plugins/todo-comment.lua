return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		-- Keymap settings
		local keymap = vim.keymap

		-- Jump to next todo comment
		keymap.set("n", "]c", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		-- Jump to previous todo comment
		keymap.set("n", "[c", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		-- Open a list of todo comments
		keymap.set("n", "<leader>td", ":TodoTrouble<CR>", { desc = "Open todo list in Trouble" })
		keymap.set("n", "<leader>cl", ":TodoLocList<CR>", { desc = "Open todo list in Location List" })
		keymap.set("n", "<leader>cq", ":TodoQuickFix<CR>", { desc = "Open todo list in Quickfix" })
		keymap.set("n", "<leader>ct", ":TodoTelescope<CR>", { desc = "Search todos with Telescope" })

		-- Setup todo-comments with default configuration
		todo_comments.setup()
	end,
}

-- TODO: This is a todo comment
--FIX: This is a fix comment
--HACK: This is a hack comment
--WARN: This is a warning comment
--PERF: This is a performance comment
--NOTE: This is a note comment
--TEST: This is a test comment ]]
