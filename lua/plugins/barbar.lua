return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    auto_hide = 1,
    maximum_padding = .5,
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout', text = "File tree" },
    },
  },
  version = '^1.0.0',
}
