return {
  'christoomey/vim-tmux-navigator',
  config = function()
    local keymap = vim.keymap
    keymap.set("i", "<C-h>", "<cmd> TmuxNavigateLeft<CR>") -- refresh file explorer
    keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>") -- refresh file explorer

    keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>") -- refresh file explorer
    keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>") -- refresh file explorer
  end
}
