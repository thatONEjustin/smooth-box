local telescope = require('telescope')
local config = require('telescope.config')
local builtins = require('telescope.builtin')

local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
    defaults = {
        layout_strategy = "flex",
    },
})

vim.keymap.set('n', '<leader>pf', builtins.find_files, {})
vim.keymap.set('n', '<C-p>', builtins.git_files, {})

vim.keymap.set('n', '<leader>vh', builtins.help_tags, {})

vim.keymap.set('n', '<leader>fd', builtins.live_grep, {})
vim.keymap.set('n', '<leader>ps', builtins.grep_string, {})
--    vim.keymap.set('n', '<leader>ps', function()
--        builtins.grep_string({ search = vim.fn.input("Grep > ") })
--    end)
