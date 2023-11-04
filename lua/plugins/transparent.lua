return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			-- groups = "*",
		})
		vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
		vim.cmd("TransparentEnable")
		vim.cmd([[TransparentEnable]])
	end,
}
