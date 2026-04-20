return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  keys = {
    { "<leader>gd", "<cmd>CodeDiff file HEAD<cr>", "Diff this file" },
    { "<leader>gD", "<cmd>CodeDiff<cr>", "Open Diff file tree" }
  },
}
