return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    require('nvim-tmux-navigation').setup({})
    vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "tmux-nvim move Left"})
    vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "tmux-nvim move Down"})
    vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "tmux-nvim move Up"})
    vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "tmux-nvim move Right"})
  end,
}
