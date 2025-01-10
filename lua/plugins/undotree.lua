return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>U", "<cmd>UndotreeToggle<cr> <cmd>UndotreeFocus<cr>", { desc = "Toggle undo tree" })

    vim.g.undotree_SplitWidth = 45
    vim.g.undotree_DiffAutoOpen = 0
  end,
}
