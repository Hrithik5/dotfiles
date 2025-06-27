return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo = require("todo-comments")
		todo.setup()
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Navigation
		map("n", "]c", todo.jump_next, { desc = "Next todo comment", table.unpack(opts) })
		map("n", "[c", todo.jump_prev, { desc = "Previous todo comment", table.unpack(opts) })

		-- Viewing
		map("n", "<leader>td", "<cmd>TodoTrouble<CR>", { desc = "Todos in Trouble", table.unpack(opts) })
		map("n", "<leader>tl", "<cmd>TodoLocList<CR>", { desc = "Todos in Location List", table.unpack(opts) })
		map("n", "<leader>tq", "<cmd>TodoQuickFix<CR>", { desc = "Todos in Quickfix List", table.unpack(opts) })
		map("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Search Todos (Telescope)", table.unpack(opts) })

		-- Toggle highlight visibility
		map("n", "<leader>th", function()
			vim.cmd("TodoTroubleToggle")
		end, { desc = "Toggle Todo Trouble View", table.unpack(opts) })
	end,
}

-- TODO: Refactor this function

-- FIXME: This logic is incorrect for edge cases

-- NOTE: Remember to update this before release

-- HACK: Temporary workaround for bug

-- PERF: Consider optimizing this loop

-- WARNING: Deprecated usage, replace soon

-- BUG: This fails with large inputs
