return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'lewis6991/gitsigns.nvim' },
  event = 'VeryLazy',
  config = function()
    local ignored_ft = { ['neo-tree'] = true, Outline = true, alpha = true }
    local last_real_buf = vim.api.nvim_get_current_buf()

    vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
      callback = function()
        local ft = vim.bo.filetype
        if not ignored_ft[ft] then
          last_real_buf = vim.api.nvim_get_current_buf()
        end
      end,
    })

    local function diff_source()
      local d = vim.b[last_real_buf] and vim.b[last_real_buf].gitsigns_status_dict
      return d and { added = d.added, modified = d.changed, removed = d.removed } or nil
    end

    local function clients_lsp()
      local clients = vim.lsp.get_clients({ bufnr = last_real_buf }) or {}
      if next(clients) == nil then return '' end
      local names = {}
      for _, c in pairs(clients) do names[#names + 1] = c.name end
      return ' ' .. table.concat(names, ' | ')
    end

    local function set_git_icon_hl()
      vim.api.nvim_set_hl(0, 'GitAddIcon',    { fg = '#8BBAA6', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitChangeIcon', { fg = '#DDC67E', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'GitDeleteIcon', { fg = '#CE5A77', bg = 'NONE' })
    end

    local grp = vim.api.nvim_create_augroup('LualineGitIconHL', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', { group = grp, callback = set_git_icon_hl })
    set_git_icon_hl()

    require('lualine').setup({
      options = {
        globalstatus = true,
        component_separators = '',
        section_separators = '',
        ignore_focus = { 'neo-tree', 'Outline', 'alpha' },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
          'filename',
        },
        lualine_c = {
          { 'branch', icon = '' },
          {
            'diff',
            source = diff_source,
            symbols = {
              added    = '%#GitAddIcon# %*',
              modified = '%#GitChangeIcon# %*',
              removed  = '%#GitDeleteIcon# %*',
            },
            colored = false,
          },
        },
        lualine_x = {
          { 'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            update_in_insert = true,
          },
        },
        lualine_y = { clients_lsp },
        lualine_z = {},
      },
      extensions = { 'toggleterm', 'trouble', 'neo-tree' },
    })
  end,
}
