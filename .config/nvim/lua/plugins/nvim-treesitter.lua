return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "astro",
      "bash",
      "blade",
      "c",
      "diff",
      "gleam",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "scss",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },
  -- config = function(_, opts)
  --   local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  --
  --   parser_config.blade = {
  --     install_info = {
  --       url = "https://github.com/EmranMR/tree-sitter-blade",
  --       files = { "src/parser.c" },
  --       branch = "main",
  --     },
  --     filetype = "blade",
  --   }
  --
  --   vim.filetype.add({
  --     pattern = {
  --       [".*%.blade%.php"] = "blade",
  --     },
  --   })
  --
  --   require("nvim-treesitter.configs").setup(opts)
  -- end,
}
