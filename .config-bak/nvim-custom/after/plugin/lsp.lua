local lsp_zero = require('lsp-zero')

lsp_zero.preset('recommended')
lsp_zero.ensure_installed({
    'astro',
    'html',
    'jsonls',
    'graphql',
    'tsserver',
    'lua_ls',
    'svelte',
    'tailwindcss',
    'vuels',
    'yamlls',
    'cssls',
    'cssmodules_ls',
    'prettier',
})

lsp_zero.nvim_workspace()

--[[
lsp_zero.on_attach(function (client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function () vim.lsp.buf.defintion() end, opts)
    vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)

    vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
end)
]]--

local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

mason.setup({})

mason_lsp.setup({
    ensure_installed = { 
        "astro", 
        "html", 
        "jsonls", 
        "graphql",
        "tsserver", 
        "lua_ls", 
        "svelte", 
        "tailwindcss",
        "vuels", 
        "yamlls", 
        "cssls", 
        "cssmodules_ls" 
    },
    handlers = {
        lsp_zero.setup(),
    },
})

--[[
lsp_zero.on_attach(function (client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})
--]]
