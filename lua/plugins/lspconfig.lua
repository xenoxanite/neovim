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

    local servers = { "nil_ls", "clangd", "rust_analyzer", "lua_ls", "tsserver", "svelte" }
    for _, k in ipairs(servers) do
      lspconfig[k].setup({
        on_attach = M.on_attach,
        capabilities = M.capabilities,
      })
    end

    lspconfig = {
      rust_analyzer = {},
      lua_ls = {
        Lua = {
          hint = { enable = true },
        },
      },
    }
  end,
}
