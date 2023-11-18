return {
  "folke/trouble.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "<leader>t", "<cmd>TroubleToggle<CR>")
  end,
}
