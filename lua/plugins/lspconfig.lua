return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    vim.diagnostic.config({
      underline = true,
      virtual_text = false,
      update_in_insert = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local fzf = require("fzf-lua")

        map("gd", fzf.lsp_definitions, "Goto definition")
        map("gr", fzf.lsp_references, "Goto references")
        map("gi", fzf.lsp_implementations, "Goto implementation")
        map("gD", fzf.lsp_declarations, "Goto declaration")
        map("<leader>D", fzf.lsp_typedefs, "Goto type definition")
        map("<leader>sd", fzf.lsp_document_symbols, "Document symbols")
        map("<leader>sw", fzf.lsp_workspace_symbols, "Workspace symbols")

        map("<leader>la", vim.lsp.buf.code_action, "Code actions", { "n", "x" })
        map("<leader>ld", vim.diagnostic.open_float, "Show diagnostics")
        map("<leader>lr", vim.lsp.buf.rename, "Rename symbol")
      end,
    })

    local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
    local diagnostic_signs = {}
    for type, icon in pairs(signs) do
      diagnostic_signs[vim.diagnostic.severity[type]] = icon
    end
    vim.diagnostic.config({ signs = { text = diagnostic_signs } })

    local function disable_semantic_tokens(client, _)
      if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
      clangd = {},
      jdtls = {},
      pyright = {},
      zls = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              disable = { "missing-fields" },
              globals = { "vim", "Snacks" },
            },
          },
        },
      },
    }

    require("mason").setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
    })

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("java").setup()
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, server.capabilities or {}, capabilities)
          require("lspconfig")[server_name].setup(vim.tbl_extend("force", server, {
            on_init = disable_semantic_tokens,
          }))
        end,
      },
    })
  end,
}
