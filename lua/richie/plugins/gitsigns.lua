return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<space>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<space>hr", gs.reset_hunk, "Reset hunk")
      map("v", "<space>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("v", "<space>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")

      map("n", "<space>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<space>hR", gs.reset_buffer, "Reset buffer")

      map("n", "<space>hu", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<space>hp", gs.preview_hunk, "Preview hunk")

      map("n", "<space>hb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<space>hB", gs.toggle_current_line_blame, "Toggle line blame")

      map("n", "<space>hd", gs.diffthis, "Diff this")
      map("n", "<space>hD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}
