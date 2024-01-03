return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    })

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>nn",
      "<cmd>Neorg keybind all core.dirman.new.note<CR>",
      { desc = "Toggle file explorer" }
    )
  end,
}
