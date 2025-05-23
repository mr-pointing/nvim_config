return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      vim.keymap.set("n", "<space>en", function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath("config")
          }
        end, { desc = 'Find files within Neovim config' })
      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension("fzf")
      
      local keymap = vim.keymap

      keymap.set("n", "<space>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<space>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      keymap.set("n", "<space>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      keymap.set("n", "<space>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
      keymap.set("n", "<space>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
