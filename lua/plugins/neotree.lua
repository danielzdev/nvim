return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_hidden = false,
        },
        follow_current_file = { enabled = true },
      },
      default_component_configs = {
        indent = {
          padding = 0,
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
        },
      },
    })

    -- Key mapping to toggle Neo-tree
    vim.keymap.set("n", "<leader>e", function()
      require("neo-tree.command").execute({
        toggle = true,
        position = "left",
      })
    end)

    -- Autocmd to open Neo-tree in the current window if opening Neovim with a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if vim.fn.isdirectory(arg) == 1 then
          require("neo-tree").setup({
            window = {
              position = "current",
            },
          })
          vim.cmd("Neotree reveal")
        end
      end,
    })
  end,
}
