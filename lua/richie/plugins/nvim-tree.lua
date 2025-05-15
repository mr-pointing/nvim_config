return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },

      -- changes folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "→",
              arrow_open = "↓",
            },
          },
        },
      },
      actions = {
        open_file = {
         window_picker = {
           enable = false,
         },
        },
      },
      filters = {
        custom = {".DS_Store"},
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps to use
    local keymap = vim.keymap
    keymap.set("n", "<space>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<space>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file for current file" })
    keymap.set("n", "<space>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Toggles tree collapse " })
    keymap.set("n", "<space>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Toggle tree refresh" })
  end
}
