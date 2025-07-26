return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    local clients_lsp = function()
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return ''
      end

      local client_names = {}
      for _, client in pairs(clients) do
        table.insert(client_names, client.name)
      end
      -- The gear icon is ''
      return ' ' .. table.concat(client_names, ' | ')
    end

    require('lualine').setup({
      options = {
        component_separators = '',
        section_separators = '',
        disabled_filetypes = { 'alpha', 'Outline', 'Neotree' },
      },
      sections = {
        lualine_a = {}, -- Removed the 'mode' section
        lualine_b = {
          {
            'filetype',
            icon_only = true,
            padding = { left = 1, right = 0 },
          },
          'filename',
        },
        lualine_c = {
          {
            'branch',
            icon = '', -- Git branch icon
          },
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            colored = false,
          },
        },
        lualine_x = {
          {
            'diagnostics',
            -- Nerd Font icons for diagnostics
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            update_in_insert = true,
          },
        },
        lualine_y = { clients_lsp },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'toggleterm', 'trouble' },
    })
  end,
}
