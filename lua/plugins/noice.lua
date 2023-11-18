return {
	"folke/noice.nvim",
	name = "noice",
	event = "UiEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("notify").setup({
			fps = 75,
			render = "compact",
			timeout = 3,
			fade_in_slide_out = "fade",
		})
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = false,
				inc_rename = false,
				lsp_doc_border = true,
			},
		})
	end,
}
