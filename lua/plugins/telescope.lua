return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      }
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local map = function(keymap, cmd, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keymap, cmd, { desc = desc })
    end

    local builtin = require "telescope.builtin"
    map("<leader><leader>", builtin.find_files, "Find files")
    map("<leader>ff", builtin.find_files, "Find files (alt key)")
    map("<leader>fh", builtin.help_tags, "Find help")
    map("<leader>fk", builtin.keymaps, "Find keymaps")
    map("<leader>fw", builtin.grep_string, "Find current word")
    map("<leader>fg", builtin.live_grep, "Find by grep")
    map("<leader>fr", builtin.oldfiles, "Find recent files")
  end,
}
