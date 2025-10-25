-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Options for the LazyVim statuscolumn
vim.g.lazyvim_statuscolumn = {
  folds_open = true, -- show fold sign when fold is open
  folds_githl = true, -- highlight fold sign with git sign color
}

-- vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#9ba0c0" })
-- vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#9ba0c0" })

vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4

vim.opt.termsync = false
-- vim.opt.foldmethod = "indent"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
