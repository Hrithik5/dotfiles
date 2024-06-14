return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- treesitter configs
    local config = require("nvim-treesitter.configs")
      config.setup({
          ensure_installed = {"lua","typescript", "python"},
          auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
    })
  end
}
