return {
	"j-hui/fidget.nvim",
	event = "UiEnter",
	config = function()
		local fidget = require("fidget")
		fidget.setup({})

		vim.notify = fidget.notify
	end,
}
