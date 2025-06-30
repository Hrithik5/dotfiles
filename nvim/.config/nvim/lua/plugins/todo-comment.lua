return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo = require("todo-comments")
		todo.setup()
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Utility to merge opts with description
		local function with_desc(desc)
			local merged = vim.tbl_extend("force", opts, { desc = desc })
			return merged
		end

		-- Navigation
		map("n", "]c", todo.jump_next, with_desc("Next todo comment"))
		map("n", "[c", todo.jump_prev, with_desc("Previous todo comment"))

		-- Viewing
		map("n", "<leader>td", "<cmd>TodoTrouble<CR>", with_desc("Todos in Trouble"))
		map("n", "<leader>tl", "<cmd>TodoLocList<CR>", with_desc("Todos in Location List"))
		map("n", "<leader>tq", "<cmd>TodoQuickFix<CR>", with_desc("Todos in Quickfix List"))
		map("n", "<leader>tt", "<cmd>TodoTelescope<CR>", with_desc("Search Todos (Telescope)"))

		-- Toggle highlight visibility
		map("n", "<leader>th", function()
			vim.cmd("TodoTroubleToggle")
		end, with_desc("Toggle Todo Trouble View"))
	end,
}

-- TODO: Refactor this function

-- FIXME: This logic is incorrect for edge cases

-- NOTE: Remember to update this before release

-- HACK: Temporary workaround for bug

-- PERF: Consider optimizing this loop

-- WARNING: Deprecated usage, replace soon

-- BUG: This fails with large inputs
