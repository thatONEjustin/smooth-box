return {
  "folke/snacks.nvim",
  priority = 1000,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    explorer = { enabled = true },
    -- picker.sources.explorer.win.list.wo.relativenumber = true,
    picker = {
      hidden = true,
      sources = {
        explorer = {
          win = {
            list = {
              wo = {
                relativenumber = true,
              },
            },
          },
        },
      },
    },
  },
}
