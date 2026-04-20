return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Language servers
        "clangd", -- C++
        "lua_ls", -- Lua
        "jdtls",  -- Java
        "ty",     -- Python

        -- Formatters
        "stylua",
      },
    })

    require("mason-lspconfig").setup({
      automatic_enable = { exclude = { "jdtls" } },
    })

    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = true },
      underline = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
        map("gr", function() Snacks.picker.lsp_references() end, "References")
        map("gI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
        map("gy", function() Snacks.picker.lsp_type_definitions() end, "Goto Type Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("<leader>ld", vim.diagnostic.open_float, "Floating diagnostics")
        map("<leader>ds", function() Snacks.picker.lsp_symbols() end, "Document Symbols")
        map("<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end, "Workspace Symbols")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
      end,
    })
  end,
}
