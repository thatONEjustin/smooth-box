return {
  "folke/snacks.nvim",
  priority = 1000,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    explorer = { enabled = false },
    dashboard = { enabled = false },
    -- picker.sources.explorer.win.list.wo.relativenumber = true,
    picker = {
      hidden = true,
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = {
          hidden = true,
          exclude = { "node_modules", ".git" },
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
