return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      -- LSP Keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>lr', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>la', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('<leader>ld', vim.diagnostic.open_float, 'Show diagnostics')
          map('gr', function() Snacks.picker.lsp_references() end, '[G]oto [R]eferences')
          map('gi', function() Snacks.picker.lsp_implementations() end, '[G]oto [I]mplementation')
          map('gd', function() Snacks.picker.lsp_definitions() end, '[G]oto [D]efinition')
          map('gD', function() Snacks.picker.lsp_declarations() end, '[G]oto [D]eclaration')
          map('gt', function() Snacks.picker.lsp_type_definitions() end, '[G]oto [T]ype Definition')
        end,
      })

      -- Diagnostic Config
      vim.diagnostic.config({
        severity_sort = true,
        virtual_text = false,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        },
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = {
        basedpyright = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file('', true) },
              completion = { callSnippet = 'Replace' },
              diagnostics = {
                disable = { 'missing-fields' },
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })
      require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

      require('mason-lspconfig').setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
