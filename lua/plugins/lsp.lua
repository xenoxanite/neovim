return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"sar/cmp-lsp.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		local M = {}

		M.on_attach = function(client, _)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
			client.server_capabilities.semanticTokensProvider = nil
		end

		M.capabilities = vim.lsp.protocol.make_client_capabilities()

		M.capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		M.capabilities.textDocument.completion.completionItem = {
			documentationFormat = { "markdown", "plaintext" },
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
			tagSupport = { valueSet = { 1 } },
			resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			},
		}

		local servers = { "nil_ls", "clangd", "rust_analyzer", "lua_ls", "tsserver" }
		for _, k in ipairs(servers) do
			lspconfig[k].setup({
				on_attach = M.on_attach,
				capabilities = M.capabilities,
			})
		end
		lspconfig.lua_ls.setup({
			on_attach = M.on_attach,
			capabilities = M.capabilities,

			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						globals = { "vim", "awesome", "client", "screen", "mouse" },
					},
				},
			},
		})
		return M
	end,
}
