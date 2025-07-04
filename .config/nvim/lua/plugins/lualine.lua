return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  opts = function(_, opts)
    if not vim.g.trouble_lualine then
      table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
    end

    opts.sections.lualine_c[4] = { "filename", path = 3 }
  end,
}
