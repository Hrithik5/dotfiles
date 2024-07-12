return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local servers = {
				lua_ls = {},
				pyright = {},
				yamlls = {},
				dockerls = {},
				bashls = {},
				gopls = {
					filetypes = { "go", "gomod", "gowork", "gotmpl" },
					settings = {
						gopls = {
							completeUnimported = true,
							usePlaceholders = true,
							analyses = {
								unusedparams = true,
							},
						},
					},
				},
				terraformls = {},
				clangd = {},
				tflint = {},
				tsserver = {
					init_options = {
						preferences = {
							disableSuggestions = true,
						},
					},
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, { desc = "Type Declaration" }, opts)
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Type Definitions" }, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "More Info" }, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Buf Implementation" }, opts)
					vim.keymap.set(
						"n",
						"<leader>wa",
						vim.lsp.buf.add_workspace_folder,
						{ desc = "Add Workspace Folder" },
						opts
					)
					vim.keymap.set(
						"n",
						"<leader>wr",
						vim.lsp.buf.remove_workspace_folder,
						{ desc = "Remove Workspace Folder" },
						opts
					)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { desc = "List Workspace Folders" }, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition" }, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Buffer Rename" }, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" }, opts)
					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Buffer reference" }, opts)
					vim.keymap.set("n", "<leader>gf", function()
						vim.lsp.buf.format({ async = true })
					end, { desc = "Format" }, opts)
				end,
			})
		end,
	},
}
