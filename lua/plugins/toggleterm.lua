return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 10,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
    })
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<A-\\>", ":ToggleTerm direction=float<CR>")
    keymap.set("t", "<A-\\>", "<Cmd>ToggleTerm<CR>", { buffer = bufnr, silent = true })
  end,
}

