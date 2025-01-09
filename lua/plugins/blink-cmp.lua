return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept", "fallback" },
    },
  },
}
