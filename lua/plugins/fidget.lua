return {
	"j-hui/fidget.nvim",
	event = "UiEnter",
	config = function()
		require("fidget").setup({})
	end,
}
