return {
  'stevearc/resession.nvim',
  dependencies = {
    'romgrk/barbar.nvim',
  },
  config = function()
    local resession = require('resession')

    resession.setup({
      extensions = {
        barbar = {},
        quickfix = {},
      },
    })

    local function is_git_repo()
      local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ';')
      return git_dir ~= ''
    end

    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        if is_git_repo() then
          resession.save(vim.fn.getcwd(), { dir = 'dirsession', notify = false })
        end
      end,
    })

    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.argc(-1) == 0 and is_git_repo() then
          resession.load(vim.fn.getcwd(), { dir = 'dirsession', silence_errors = true })
        end
      end,
      nested = true,
    })

    vim.keymap.set('n', '<leader>ss', function()
      resession.save(vim.fn.getcwd(), { dir = 'dirsession' })
    end, { desc = 'Save current dir session' })

    vim.keymap.set('n', '<leader>sl', function()
      resession.load(nil, { dir = 'dirsession' })
    end, { desc = 'Browse and load sessions' })

    vim.keymap.set('n', '<leader>sd', function()
      resession.delete(nil, { dir = 'dirsession' })
    end, { desc = 'Browse and delete sessions' })
  end,
}
