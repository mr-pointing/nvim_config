local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit Insert mode with jk" })

keymap.set("n", "<space>x", ":.lua<CR>")
keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
keymap.set("v", "<space>x", ":lua<CR>")
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- increments/decrements integers
keymap.set("n", "<space>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<space>-", "<C-x>", { desc = "Decrement number" })

-- window splitting
keymap.set("n", "<space>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<space>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<space>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<space>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<space>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<space>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<space>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<space>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<space>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
