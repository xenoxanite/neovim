return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"sar/cmp-lsp.nvim",
	},
	config = function()
		vim.diagnostic.config({
			virtual_text = false,
		})

		-- Show line diagnostics automatically in hover window
		vim.o.updatetime = 250
		vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

		local lsp = vim.lsp

		local on_attach = function(client, bufnr)
			local map_opts = {
				buffer = true,
				silent = true,
			}
			local float_window_width = 45
			lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				width = float_window_width,
			})
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = { "lua_ls", "clangd", "nil_ls", "tsserver", "rust_analyzer" }

		local lspconfig = require("lspconfig")

		for _, lang in pairs(servers) do
			lspconfig[lang].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end
	end,
}
