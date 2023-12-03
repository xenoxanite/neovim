local M = {
  "echasnovski/mini.indentscope",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
}

function M.config()
  require("mini.indentscope").setup()
end

return M
