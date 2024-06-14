return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Open Undo Tree" })
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 30
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
