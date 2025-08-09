return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('conform').setup({
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true, lua = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    })

    vim.api.nvim_create_user_command('AutoFormat', function(args)
      if args.bang then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      end
    end, {
    desc = 'Toggle format on save globally or for the current buffer',
    bang = true,
  })

  vim.keymap.set('', '<leader>lf', function() require('conform').format({ async = true, lsp_format = 'fallback' }) end, { desc = 'Format buffer' })
  vim.keymap.set('n', '<leader>uf', '<cmd>AutoFormat<cr>', { silent = true, desc = 'Toggle format on save (buffer)' })
  vim.keymap.set('n', '<leader>uF', '<cmd>AutoFormat!<cr>', { silent = true, desc = 'Toggle format on save (global)' })
end,
}
