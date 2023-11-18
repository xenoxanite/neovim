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
  priority = 1000,
}

local decay = {
  "decaycs/decay.nvim",
  config = function()
    require("decay").setup({
      style = "dark",
    })
  end,
}


return decay
