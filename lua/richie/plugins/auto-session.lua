return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
    })

    local keymap = vim.keymap
    keymap.set("n", "<space>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<space>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
  end,
}
