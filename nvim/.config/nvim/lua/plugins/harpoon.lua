return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local harpoon = require("harpoon").setup()
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    -- Harpoon related key bindings
    vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add to harpoon list" })
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Move to previous in harpoon list" })
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Move to next in harpoon list" })

    -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
  end
}
