return {
  "p00f/cphelper.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local home = os.getenv("HOME")
    vim.g["cph#dir"] = home .. "/Programming/competetive-programming"
    vim.g["cph#lang"] = "cpp"
  end,
}
