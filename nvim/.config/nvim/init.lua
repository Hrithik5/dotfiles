-- lazyvim package installer config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Load all plugin configurations from 'plugins' directory
local plugin_configs = vim.fn.stdpath("config") .. "/plugins/*.lua"
for _, file in ipairs(vim.fn.glob(plugin_configs, true, true)) do
	dofile(file)
end
