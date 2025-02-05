vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.cmd("set rnu")

vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.title = false
vim.opt.conceallevel = 2

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move Up" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move Down" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move Left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move Right" })

-- Buffers commands
vim.keymap.set("n", "<C-x>", ":bd<CR>", { desc = "Close current file in buffer" })
vim.keymap.set("n", "<leader>cb", ":bw<CR>", { desc = "Close all files in the buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Switch to next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Switch to previous buffer" })

-- Modify Save command to better usage
vim.keymap.set("n", "<C-s>", ":w<CR>,", { desc = "Save the file" })

-- CodeRunner keybindings
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Run Code" })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { desc = "Run File" })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { desc = "Run file in new tab" })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { desc = "Run the project" })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { desc = "Close the runner window" })

-- Noice Plugin
vim.keymap.set("n", "<leader>nh", "<cmd>:Noice telescope<CR>", { desc = "Noice Message history in Telescope" })

-- Git-blame plugin
vim.keymap.set("n", "<leader>bt", "<cmd>:GitBlameToggle<CR>", { desc = "Toggle git blame " })
vim.keymap.set("n", "<leader>be", "<cmd>:GitBlameEnable<CR>", { desc = "Blame Enable" })
vim.keymap.set("n", "<leader>bd", "<cmd>:GitBlameDisable<CR>", { desc = "Blame Disable" })
vim.keymap.set("n", "<leader>bo", "<cmd>:GitBlameOpenFileURL<CR>", { desc = "Open the file in browser" })

-- Trouble Plugin
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
vim.keymap.set(
	"n",
	"<leader>xw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ desc = "Open Trouble workspace diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>xd",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	{ desc = "Open Trouble document diagnostics" }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble toggle quickfix" })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = " Trouble toggle for loclist" })

vim.opt.hlsearch = true
-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Nohlsearch" })
vim.wo.number = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
