return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			-- open_mapping = [[<leader>/]],
			direction = "float",
			shade_filetypes = {},
			hide_numbers = true,
			insert_mappings = true,
			terminal_mappings = true,
			start_in_insert = true,
			close_on_exit = true,
		})
		-- Define custom key mappings
		local opts = { noremap = true, silent = true }
		local set_keymap = vim.api.nvim_set_keymap

		-- Split terminal horizontally and vertically
		set_keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
		set_keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)

		-- Terminal mode movement keybindings
		set_keymap("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		set_keymap("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		set_keymap("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		set_keymap("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

		-- Window management keybindings
		set_keymap("t", "<C-w>", [[<C-\><C-n><C-W>w]], opts)
		set_keymap("t", "<C-w>s", [[<C-\><C-n><C-W>s]], opts)
		set_keymap("t", "<C-w>v", [[<C-\><C-n><C-W>v]], opts)
	end,
	cmd = "ToggleTerm",
	keys = {
		{
			"<leader>/",
			"<cmd>ToggleTerm direction=horizontal dir=%:p:h<cr>",
			desc = "Open Terminal",
		},
		{ "<leader>tc", "<cmd>ToggleTerm direction=float dir=%:p:h<cr>", desc = "Toggle terminal in CWD" },
		{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
		{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle vertical terminal" },
	},
}
