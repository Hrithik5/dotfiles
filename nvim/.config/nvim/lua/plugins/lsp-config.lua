return {
	-- 🧩 Mason: Installs LSPs, DAPs, Linters, Formatters
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- 🔧 Mason-LSPConfig: Integrates Mason with nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"yamlls",
				"dockerls",
				"bashls",
				"gopls",
				"terraformls",
				"clangd",
			},
			automatic_installation = true,
		},
	},

	-- ⚙️ Core LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		lazy = false,
		config = function()
			-- 🧠 Safe requires
			local ok_mason, mason = pcall(require, "mason")
			local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
			local ok_lsp, lspconfig = pcall(require, "lspconfig")

			if not (ok_mason and ok_mason_lsp and ok_lsp) then
				vim.notify("❌ Mason or LSPConfig not found!", vim.log.levels.ERROR)
				return
			end

			-- 🚀 Ensure mason is ready
			mason.setup()
			mason_lspconfig.setup()

			-- 🔧 Capabilities (for nvim-cmp completion)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if ok_cmp then
				capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
			end

			-- 🌐 LSP Server-specific settings
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				},
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
							analyses = { unusedparams = true },
						},
					},
				},
				terraformls = {},
				clangd = {},
			}

			-- 🧩 Safe server setup wrapper
			local function setup_server(server_name)
				local opts = servers[server_name] or {}
				opts.capabilities = capabilities

				if not lspconfig[server_name] then
					vim.notify("⚠️ LSP server not found: " .. server_name, vim.log.levels.WARN)
					return
				end

				lspconfig[server_name].setup(opts)
			end

			-- 🧱 Setup mason-lspconfig safely (future-proof)
			if mason_lspconfig.setup_handlers then
				mason_lspconfig.setup_handlers({
					function(server_name)
						setup_server(server_name)
					end,
				})
			else
				vim.notify("⚠️ setup_handlers() missing — using fallback setup", vim.log.levels.WARN)
				for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
					setup_server(server_name)
				end
			end

			-- 🔑 Keymaps when LSP attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local map = vim.keymap.set
					local opts = { buffer = ev.buf, silent = true }

					map("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
					map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
					map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
					map("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
					map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
					map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
					map("n", "<leader>gf", function()
						vim.lsp.buf.format({ async = true })
					end, { desc = "Format Buffer" })
					map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })
					map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder" })
					map("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { desc = "List Workspace Folders" })
				end,
			})
		end,
	},
}
