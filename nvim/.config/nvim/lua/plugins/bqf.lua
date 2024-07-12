return {
	"kevinhwang91/nvim-bqf",
	ft = "qf", -- Load only for quickfix filetype
	config = function()
		require("bqf").setup({
			auto_resize_height = true,
			preview = {
				auto_preview = true,
				border_chars = { "│", "─", "╭", "╮", "╯", "╰", "│", "─" },
				delay_syntax = 50,
				win_height = 15,
				win_vheight = 15,
				wrap = false,
			},
			func_map = {
				open = "o",
				drop = "O",
				split = "<C-s>",
				vsplit = "<C-v>",
				tabdrop = "<C-t>",
				prevfile = "p",
				nextfile = "n",
				prev = "<C-p>",
				next = "<C-n>",
				stoggleup = "<S-x>",
				stoggledown = "x",
				stogglevm = "<S-Space>",
				fzffilter = "f",
			},
			filter = {
				fzf = {
					action_for = {
						["ctrl-s"] = "split",
						["ctrl-v"] = "vsplit",
						["ctrl-t"] = "tab drop",
					},
					extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
				},
			},
		})

		-- Key mappings for easy access
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- Open Quickfix
		keymap("n", "<leader>qo", ":copen<CR>", opts)
		-- Close Quickfix
		keymap("n", "<leader>qc", ":cclose<CR>", opts)
		-- Next Quickfix item
		keymap("n", "<leader>qn", ":cnext<CR>", opts)
		-- Previous Quickfix item
		keymap("n", "<leader>qp", ":cprev<CR>", opts)
		-- Filter with fzf
		keymap("n", "<leader>qf", ":BqfFzf<CR>", opts)
	end,
}
