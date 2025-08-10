return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_hidden = false,
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = {
          padding = 0,
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
        },
      },
      window = { position = 'left' },
    })

    vim.keymap.set('n', '<leader>e', function()
      require('neo-tree.command').execute({ toggle = true, position = 'left' })
    end, { desc = 'Toggle neotree' })

    local function refresh_neotree()
      pcall(function()
        local mgr = require('neo-tree.sources.manager')
        local state = mgr.get_state('filesystem')
        if state then
          require('neo-tree.sources.filesystem.commands').refresh(state)
        end
      end)
      pcall(function()
        require('neo-tree.sources.git_status').refresh()
      end)
    end

    vim.api.nvim_create_autocmd('TermClose', {
      pattern = '*lazygit*',
      callback = refresh_neotree,
      desc = 'Refresh Neo-tree after LazyGit closes',
    })
  end,
}
