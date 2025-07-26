return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 500,
    icons = {
      mappings = true,
      keys = {},
    },
    spec = {
      { 'g', group = '[G]o to' },
      { 's', group = '[S]urround' },
      { '<leader>b', group = '[B]uffef' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>l', group = '[L]sp' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>u', group = '[T]oggle' },
      { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
    },
  },
}
