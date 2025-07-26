local map = function(l, r, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, l, r, { desc = desc })
end

map('<C-h>', '<C-w>h', 'Move to left window')
map('<C-j>', '<C-w>j', 'Move to bottom window')
map('<C-k>', '<C-w>k', 'Move to upper window')
map('<C-l>', '<C-w>l', 'Move to right window')

map('<leader>w', '<cmd>w<cr><ESC>', 'Save file')
map('<leader>q', '<cmd>qa<cr>', 'Quit neovim')

map('<', '<gv', 'Better indenting <-', 'v')
map('>', '>gv', 'Better indenting ->', 'v')

map('<ESC>', '<cmd>noh<cr><ESC>', 'Clear search highlights')
map('<S-CR>', '<C-o>o', 'Insert new line below current', 'i')

map(',', ',<c-g>u', 'add breakpoint on pressing ,', 'i')
map('.', '.<c-g>u', 'add breakpoint on pressing .', 'i')
map(';', ';<c-g>u', 'add breakpoint on pressing ;', 'i')

map('<S-h>', '<cmd>bprev<cr>', 'Prev buffer')
map('<S-l>', '<cmd>bnext<cr>', 'Next buffer')

map('<leader>p', [["_dP"]], 'Paste over selection without yanking', 'v')
