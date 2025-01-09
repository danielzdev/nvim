return {
  "otavioschwanck/arrow.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    require("arrow").setup({
      show_icons = true,
      leader_key = "m",
      buffer_leader_key = "<leader>m",
    })

    vim.keymap.set("n", "H", require("arrow.persist").previous)
    vim.keymap.set("n", "L", require("arrow.persist").next)
    vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
  end,
}
