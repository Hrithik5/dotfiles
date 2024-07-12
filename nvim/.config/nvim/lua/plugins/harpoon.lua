return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon").setup()

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = require("telescope.config").values.file_previewer({}),
					sorter = require("telescope.config").values.generic_sorter({}),
				})
				:find()
		end

		-- Harpoon related key bindings
		vim.keymap.set("n", "<leader>hl", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open Harpoon window" })
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add to Harpoon list" })
		vim.keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end, { desc = "Remove from Harpoon list" })
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Move to previous in Harpoon list" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Move to next in Harpoon list" })

		-- Uncomment the following lines if you want to directly select items by number
		-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
		-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
		-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
	end,
}
