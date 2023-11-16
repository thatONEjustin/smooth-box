local lsp_zero = require('lsp-zero')

lsp_zero.preset('recommended')
lsp_zero.setup()

local mason = require('mason')
local mason_lsp = require('mason-lspconfig')

mason.setup({})

mason_lsp.setup({
    ensure_installed = { "astro", "html", "jsonls", "graphql", "tsserver", "lua_ls", "svelte", "tailwindcss", "vuels", "yamlls", "cssls", "cssmodules_ls" },
    handlers = {
        lsp_zero.default_setup,
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
