return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "Format file",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}
