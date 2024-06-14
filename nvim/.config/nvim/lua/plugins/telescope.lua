return {
 {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
         end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ThePrimeagen/harpoon",
    },
    config = function()
      -- telescope key-bindings
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files"})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep in Files"})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Show items in Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help utility" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Recently opened Files" })
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
      vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("noice")

    end,
  },
}
