local map = require("utils.safe_keymap").safe_keymap

map("<C-h>", "<C-w>h", "Move to left window")
map("<C-j>", "<C-w>j", "Move to bottom window")
map("<C-k>", "<C-w>k", "Move to upper window")
map("<C-l>", "<C-w>l", "Move to right window")

map("<leader>w", "<cmd>w<cr><ESC>", "Save file")
map("<leader>q", "<cmd>qa<cr>", "Quit neovim")

map("<", "<gv", "Better indenting <-", "v")
map(">", ">gv", "Better indenting ->", "v")

map("<ESC>", "<cmd>noh<cr><ESC>", "Clear search highlights")
map("<S-CR>", "<C-o>o", "Insert new line below current", "i")

map(",", ",<c-g>u", "add breakpoint on pressing ,", "i")
map(".", ".<c-g>u", "add breakpoint on pressing .", "i")
map(";", ";<c-g>u", "add breakpoint on pressing ;", "i")
map("<leader>tt", "<cmd>Floaterminal<cr>", "Open floating terminal")

map("<esc><esc>", "<c-\\><c-n>", "Exit terminal mode with x2 ESC", "t")
map("<leader>tt", require("utils.terminal").toggle_terminal, "Toggle terminal")
