local map = function(key, cmd, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, key, cmd, { desc = desc })
end

map("<C-h>", "<C-w>h", "Move to left window")
map("<C-j>", "<C-w>j", "Move to bottom window")
map("<C-k>", "<C-w>k", "Move to upper window")
map("<C-l>", "<C-w>l", "Move to right window")

map("<S-h>", "<cmd>bprevious<cr>", "Prev buffer")
map("<S-l>", "<cmd>bnext<cr>", "Next buffer")

map("n", "<leader>w", "<cmd>w<cr><ESC>", "Save file")
map("n", "<leader>q", "<cmd>qa<cr>", "Quit neovim")

map("v", "<", "<gv", "Better indenting <-")
map("v", ">", ">gv", "Better indenting ->")

map("<ESC>", "<cmd>noh<cr><ESC>", "Clear search highlights")
map("i", "<S-CR>", "<C-o>o", "Insert new line below current")
