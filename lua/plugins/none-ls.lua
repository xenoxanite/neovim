return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.nixfmt,
        null_ls.builtins.formatting.clang_format,
      },
    })
    local keymap = vim.keymap
    keymap.set("i", "<C-f>", "<cmd>lua vim.lsp.buf.format()<CR>") -- refresh file explorer
    keymap.set("n", "<C-f>", "<cmd>lua vim.lsp.buf.format()<CR>") -- refresh file explorer
    keymap.set("v", "<C-f>", "<cmd>lua vim.lsp.buf.format()<CR>") -- refresh file explorer
  end,
}
