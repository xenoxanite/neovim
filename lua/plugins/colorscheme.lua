local nightfox = {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {

        transparent = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    })
    vim.cmd("colorscheme nightfox")
  end,
}

local pywal = {
  "xenoxanite/pywal.nvim",
  as = "pywal",
  config = function()
    -- local pywal16 = require("pywal16")
    -- pywal16.setup()
    local pywal = require("pywal")
    pywal.setup()
  end,
  priority = 1000, -- recommended to ensure the colorscheme
  -- is loaded before other plugins
}

return pywal
