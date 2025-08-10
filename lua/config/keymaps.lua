local map = function(lhs, rhs, opts, mode)
  local o = type(opts) == 'string' and { desc = opts } or (opts or {})
  vim.keymap.set(mode or 'n', lhs, rhs, o)
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

map('<leader>p', '"_dP', 'Paste over selection without yanking', 'v')
map('<leader>d', '"_d', { silent = true, desc = 'Delete without yanking' }, { 'n', 'x' })
map('<leader>y', '<cmd>silent %y+<CR>', { desc = 'Yank entire buffer to clipboard' })
