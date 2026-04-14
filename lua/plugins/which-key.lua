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
      { '<leader>g', group = '[G]it' },
      { '<leader>l', group = '[L]sp' },
      { '<leader>u', group = '[U]Toggle' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>x', group = '[T]rouble' },
    },
  },
}
