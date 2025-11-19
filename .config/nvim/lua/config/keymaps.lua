-- Vim movements
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
-- endof Vim movements

-- TMUX
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
-- endof TMUX

-- file comparison
vim.keymap.set("n", "<leader>sC", function()
  require("telescope").extensions.diff.diff_files({ hidden = true })
end, { desc = "Compare 2 files" })

vim.keymap.set("n", "<leader>sc", function()
  require("telescope").extensions.diff.diff_current({ hidden = true })
end, { desc = "Compare file with current" })
-- endof file comparison

-- oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local strudel = require("strudel")
vim.keymap.set("n", "<leader>sl", strudel.launch, { desc = "Launch Strudel" })
vim.keymap.set("n", "<leader>sq", strudel.quit, { desc = "Quit Strudel" })
vim.keymap.set("n", "<leader>sP", strudel.toggle, { desc = "Strudel Toggle Play/Stop" })
vim.keymap.set("n", "<leader>su", strudel.update, { desc = "Strudel Update" })
vim.keymap.set("n", "<leader>ss", strudel.stop, { desc = "Strudel Stop Playback" })
vim.keymap.set("n", "<leader>sb", strudel.set_buffer, { desc = "Strudel set current buffer" })
vim.keymap.set("n", "<leader>sx", strudel.execute, { desc = "Strudel set current buffer and update" })
