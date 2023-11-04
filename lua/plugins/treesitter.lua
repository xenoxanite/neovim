return {
  "nvim-treesitter/nvim-treesitter",
  LazyDone = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "nix", "lua", "typescript" },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
