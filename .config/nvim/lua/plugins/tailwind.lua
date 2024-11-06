return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          lint = {
            cssConflict = "ignore",
            unknownAtRules = "ignore",
            invalidApply = "ignore",
          },
          config = {
            validate = true,
            lint = {
              cssConflict = "ignore",
              unknownAtRules = "ignore",
              invalidApply = "ignore",
            },
          },
          settings = {
            validate = true,
            lint = {
              cssConflict = "ignore",
              unknownAtRules = "ignore",
              invalidApply = "ignore",
            },
          },
        },
        svelte = {
          css = {
            enable = false,
          },
          plugin = {
            css = {
              enable = false,
            },
          },
          config = {
            plugin = {
              css = {
                enable = false,
              },
            },
          },
          settings = {
            plugin = {
              css = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        tailwind = true,
        names = false,
        css = true,
        css_fn = true,
        always_update = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
          require("tailwindcss-colorizer-cmp").setup({})
        end,
      },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
