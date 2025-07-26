return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'css',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'markdown',
        'python',
        'toml',
        'typescript',
        'vim',
        'vimdoc',
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
