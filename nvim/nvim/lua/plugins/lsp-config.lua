return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		dependencies = {
			-- Automatiza las herramientas que no son LSPs (formateadores, DAPs)
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()

			-- Lista exacta de tus herramientas externas visualizadas en Mason
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",             -- Formateador para HTML/CSS/JS
					"codelldb",             -- Depurador para C/C++/Rust
					"debugpy",              -- Depurador para Python
					"java-debug-adapter",    -- Depurador para Java
					"java-test",            -- Suite de pruebas para Java
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- Todos tus LSPs agregados para instalación 100% automática
			ensure_installed = { 
				"bashls", 
				"clangd", 
				"cssls", 
				"emmet_language_server", 
				"html", 
				"jdtls", 
				"lua_ls", 
				"pylsp", 
				"rust_analyzer", 
				"terraformls" 
			},
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			
			-- Servidores que se acoplan al bucle estándar (dejando fuera jdtls)
			local servers = { 
				"bashls", 
				"clangd", 
				"cssls", 
				"emmet_language_server", 
				"html", 
				"lua_ls", 
				"pylsp", 
				"rust_analyzer", 
				"terraformls" 
			}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Declaration" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Definitions" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
		end,
	},
}

