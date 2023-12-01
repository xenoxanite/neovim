local M = {}

function M.toggle_buffer_inlay_hints()
	if vim.lsp.inlay_hint.is_enabled() then
		vim.lsp.inlay_hint.enable(0, false)
	else
		vim.lsp.inlay_hint.enable(0, true)
	end
end

return M
