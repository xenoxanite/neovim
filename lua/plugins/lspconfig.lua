return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"sar/cmp-lsp.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		vim.diagnostic.config({
			virtual_text = false,
		})
		vim.o.updatetime = 250
		vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

		local on_attach = function(client, bufnr)
			if vim.fn.has("nvim-0.10") == 1 then
				vim.lsp.inlay_hint.enable(0, true)
			end
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = { "nil_ls", "clangd", "rust_analyzer", "lua_ls", "tsserver", "svelte" }
		for _, k in ipairs(servers) do
			lspconfig[k].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					hint = { enable = true },
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							[vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
							[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})
		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local config = {
			-- disable virtual text
			virtual_text = false,
			-- show signs
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
				suffix = "",
			},
		}

		vim.diagnostic.config(config)
	end,
}
