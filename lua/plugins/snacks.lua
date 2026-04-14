return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true,
        },
      },
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
  },
  keys = {
    -- Find
    { '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep' },
    { '<leader><leader>', function() Snacks.picker.files() end, desc = 'Find Files' },
    { '<leader>fc', function() Snacks.picker.command_history() end, desc = 'Command History' },
    { '<leader>fm', function() Snacks.picker.marks() end, desc = 'Marks' },
    { '<leader>fn', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
    { '<leader>fs', function() Snacks.picker.git_status() end, desc = 'Git status' },
    { '<leader>fw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },
    { '<leader>fu', function() Snacks.picker.undo() end, desc = 'Undo History' },

    -- Search
    { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },

    -- Buffer
    { '<leader>c', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
    { '<leader>bo', function() Snacks.bufdelete.other() end, desc = 'Delete other buffers' },
    { '<leader>bd', function() Snacks.bufdelete.all() end, desc = 'Delete all buffers' },

    -- Misc
    { '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications' },
    { '<leader>uC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
        Snacks.toggle.diagnostics():map('<leader>ud')
        Snacks.toggle.line_number():map('<leader>ul')
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }) :map('<leader>uc')
        Snacks.toggle.treesitter():map('<leader>uT')
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>ub')
        Snacks.toggle.inlay_hints():map('<leader>uh')
        Snacks.toggle.indent():map('<leader>ug')
        Snacks.toggle.dim():map('<leader>uD')
      end,
    })
  end,
}
