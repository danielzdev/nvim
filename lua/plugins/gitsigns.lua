return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
    signs_staged = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
    },
    on_attach = function(buffer)
      local gs = require('gitsigns')
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          ---@diagnostic disable-next-line: param-type-mismatch
          gs.nav_hunk('next')
        end
      end, 'Next Hunk')

      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          ---@diagnostic disable-next-line: param-type-mismatch
          gs.nav_hunk('prev')
        end
      end, 'Prev Hunk')

      map('n', '<leader>gs', gs.stage_hunk, 'Stage Hunk')
      map('n', '<leader>gr', gs.reset_hunk, 'Unstage Hunk')
      map('v', '<leader>gs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
      map('v', '<leader>gr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
      map('n', '<leader>gS', gs.stage_buffer)
      map('n', '<leader>gR', gs.reset_buffer)
      map('n', '<leader>gp', gs.preview_hunk_inline)
      map('n', '<leader>gb', function() gs.blame_line({ full = true }) end)
    end,
  },
}
